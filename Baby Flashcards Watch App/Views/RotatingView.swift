//
//  RotatingView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI
import CoreMotion
import AVFoundation


struct RotatingView<Content: View>: View {
    let originalViews: [Content]
    let keys: [String]
    @State private var isOptionsSheetPresented = false
    @State private var views: [Content]
    @State private var currentIndex = 0
    @State private var isFacingUser = true
    @State private var isRandomListEnabled = false
    @State private var audioPlayer: AVAudioPlayer?
    private var audioPlayer: AVAudioPlayer?
    
    let motionManager = CMMotionManager()
    
    init(views: [Content], keys: [String]) {
        self.originalViews = views
        self.keys = keys
        _views = State(initialValue: views)
    }
    
    var body: some View {
        ZStack {
            views[currentIndex]
                .rotationEffect(.degrees(isFacingUser ? 0 : 180))
                .onAppear(perform: startMonitoringDeviceMotion)
                .onTapGesture {
                    playSound(soundName: keys[currentIndex])
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
                            OptionsView(isOptionsSheetPresented: $isOptionsSheetPresented, isRandomListEnabled: $isRandomListEnabled)
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
    
    func playSound(soundName: String) {
        let directory = UserPreferences.selectedLanguage
        print(directory)
        if let path = Bundle.main.path(forResource: soundName.lowercased(), ofType: "mp3", inDirectory: directory) {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay() // Preload audio
                audioPlayer?.play()
                print("Sound played")
            } catch let audioError as NSError {
                print("Error playing sound: \(audioError.localizedDescription)")
            }
        } else {
            print("No sound found")
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
    @Binding var isOptionsSheetPresented: Bool
    @Binding var isRandomListEnabled: Bool
    @State private var selectedLanguage = UserPreferences.selectedLanguage
    let languages = [
        "en": "English",
        "pt": "Portuguese",
        "es": "Spanish",
        "de": "German",
        "fi": "Finnish",
        "it": "Italian",
        "nl": "Dutch"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Toggle(isOn: $isRandomListEnabled) {
                    Text("Random List")
                }
                
                Divider()
                
                Text("Languages")
                    .font(.headline)
                
                ForEach(Array(languages.keys), id: \.self) { language in
                    Button(action: {
                        selectedLanguage = language
                        UserPreferences.selectedLanguage = language
                        isOptionsSheetPresented = false
                    }) {
                        HStack {
                            Text(languages[language, default: "Unknown"])
                            Spacer()
                            if language == selectedLanguage {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                
            }.padding(.horizontal)
        }
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
            ],
            keys: []
        )
    }
}
