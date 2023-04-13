//
//  musicPlayerView.swift
//  Music_Player
//
//  Created by Oluwayomi M on 2023-04-01.
//
import SwiftUI
import AVFoundation

struct MusicPlayerView: View {
    @StateObject private var musicPlayer = MusicPlayer()
    
    var body: some View {
        VStack {
            Text("Music Player")
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding()
            
            Button(action: {
                if musicPlayer.isPlaying {
                    musicPlayer.pause()
                } else {
                    musicPlayer.play()
                }
            }) {
                Image(systemName: musicPlayer.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
