//
//  GeneralUility.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/21/21.
//

import AVFoundation
import SwiftUI
import Firebase

// MARK: - AUDIO FX
var audioPlayer: AVAudioPlayer?

func playSound(file: String, type: String) {
 
    if let url = Bundle.main.url(forResource: file, withExtension: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file requested! Error:\(error)")
        }
    }
}

// MARK: - HAPTICS FEEDBACK
let haptic = UIImpactFeedbackGenerator(style: .medium)
let feedback = UINotificationFeedbackGenerator()


// MARK: - FIRESTORE REFERENCE
let db = Firestore.firestore()


// MARK: - DESTINATIONS STORED FILE
var destinationsArray: [Destination] = [Destination]()
