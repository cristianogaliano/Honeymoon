//
//  AudioFXPlayer.swift
//  Honeymoon
//
//  Created by  Cristiano on 16/10/21.
//

import Foundation
import AVFoundation

class AudioFXPlayer {
    var audioPlayer: AVAudioPlayer?

    
    func playSoundClick() {
        if let url = Bundle.main.url(forResource: "sound-click", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file requested! Error:\(error)")}}
    }
    
    func playSoundRise() {
        if let url = Bundle.main.url(forResource: "sound-rise", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file requested! Error:\(error)")}}
    }
    
    func playCustomSound(file: String, type: String) {
     
        if let url = Bundle.main.url(forResource: file, withExtension: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file requested! Error:\(error)")
            }
        }
    }
    
}

let audioFXPlayer = AudioFXPlayer()
