//
//  RotatingView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI
import CoreMotion

struct RotatingView<Content: View>: View  {
    let originalViews: [Content]
    @State private var views: [Content]
    @State private var currentIndex = 0
    @State private var isFacingUser = true
    @State private var isOptionsSheetPresented = false
    @State private var isRandomListEnabled = false
    
    let motionManager = CMMotionManager()
    
    init(views: [Content]) {
        self.originalViews = views
        _views = State(initialValue: views)
    }
    
    var body: some View {
        ZStack {
            views[currentIndex]
                .rotationEffect(.degrees(isFacingUser ? 0 : 180))
                .onAppear(perform: startMonitoringDeviceMotion)
                .onTapGesture {
                    updateIndex()
                }
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "ellipsis.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(4)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            isOptionsSheetPresented = true
                        }
                        .sheet(isPresented: $isOptionsSheetPresented) {
                            OptionsView(isRandomListEnabled: $isRandomListEnabled)
                        }
                }
                
                Spacer()
            }
           
        }
        
    }
    
    func startMonitoringDeviceMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.2
            motionManager.startDeviceMotionUpdates(to: .main) { [self] (motion, error) in
                if let motion = motion {
                    processDeviceMotion(motion)
                }
            }
        }
    }
    
    func processDeviceMotion(_ motion: CMDeviceMotion) {
        
        let rotationRate = motion.attitude.pitch
        let rotationRateThreshold: Double = 0.1 // Choose an appropriate threshold
        
        if rotationRate < -rotationRateThreshold && isFacingUser {
            // Assume user is flipping the watch away
            isFacingUser = false
        } else if rotationRate > rotationRateThreshold && !isFacingUser {
            // Assume user is flipping the watch back towards them
            isFacingUser = true
            updateIndex()
        }
    }
    
    func updateIndex() {
        if isRandomListEnabled {
            views = originalViews.shuffled()
        } else {
            views = originalViews
        }
        
        currentIndex = (currentIndex + 1) % (views.count)
    }
}

struct OptionsView: View {
    @Binding var isRandomListEnabled: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $isRandomListEnabled) {
                Text("Random List")
            }
            Spacer()
        }
        .padding()
    }
}

struct RotatingView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingView<Text>(
            views: [
                Text(String("A"))
                    .font(.system(size: 70, weight: .heavy, design: .rounded)),
                Text(String("B"))
                    .font(.system(size: 70, weight: .heavy, design: .rounded))
            ]
        )
    }
}
