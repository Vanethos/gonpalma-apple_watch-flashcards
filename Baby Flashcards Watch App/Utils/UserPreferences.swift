//
//  UserPreferences.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 29/08/2023.
//

import Foundation

struct UserPreferences {
    static let selectedLanguageKey = "selectedLanguage"
        
        static let supportedLanguages: [String: String] = [
            "en": "English",
            "pt": "Portuguese",
            "es": "Spanish",
            "de": "German",
            "fi": "Finnish",
            "it": "Italian",
            "nl": "Dutch"
        ]

        static var selectedLanguage: String {
            get {
                if let storedLanguage = UserDefaults.standard.string(forKey: selectedLanguageKey) {
                    return storedLanguage
                } else {
                    let systemLanguageComponents = (Locale.current.identifier).split(separator: "_")
                    let baseSystemLanguage = String(systemLanguageComponents.first ?? "en")
                    let defaultLanguage = supportedLanguages.keys.contains(baseSystemLanguage) ? baseSystemLanguage : "en"
                    
                    UserDefaults.standard.set(defaultLanguage, forKey: selectedLanguageKey)
                    return defaultLanguage
                }
            }
            set {
                UserDefaults.standard.set(newValue, forKey: selectedLanguageKey)
            }
        }
}
