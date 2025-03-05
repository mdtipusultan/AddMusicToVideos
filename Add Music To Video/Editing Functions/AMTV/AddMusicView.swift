//
//  AddMusicView.swift
//  Add Music To Video
//
//  Created by  Tipu Sultan on 3/4/25.
//

import SwiftUI
import AVKit

struct AddMusicView: View {
    var videoURL: URL?  // Receive the selected video URL

    var body: some View {
        VStack {
            if let videoURL = videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
            } else {
                Text("No video selected")
                    .foregroundColor(.gray)
                    .padding()
            }

            Spacer()
            
            Text("Add Music to Your Video")
                .font(.title)
                .bold()
                .padding()

            // Add Music Button (Functionality will be added later)
            Button(action: {
                print("Add music functionality goes here")
            }) {
                HStack {
                    Image(systemName: "music.note")
                    Text("Select Music")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    AddMusicView(videoURL: nil) // Preview with no video
}
