//
//  Baby_FlashcardsApp.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI
import AVFAudio

@main
struct Baby_Flashcards_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
    
    init() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            
            print("Audio initialized")
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
}
