//
//  MusicPlayer.swift
//  Music_Player
//
//  Created by Oluwayomi M on 2023-04-01.
//

import Foundation
import AVFoundation

class MusicPlayer: ObservableObject {
    private var player: AVAudioPlayer?

    var isPlaying: Bool {
        player?.isPlaying ?? false
    }

    init() {
        // Prepare the audio player with a sample audio file
        if let url = Bundle.main.url(forResource: "Gangster", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }

    func play() {
        player?.play()
        objectWillChange.send()
    }

    func pause() {
        player?.pause()
        objectWillChange.send()
    }
}

