//
//  VideoEditorView.swift
//  Add Music To Video
//
//  Created by  Tipu Sultan on 3/4/25.
//

import SwiftUI
import AVKit
//
//struct VideoEditorView: View {
//    @State private var videoURL: URL?
//    @State private var audioURL: URL?
//    @State private var isVideoPickerPresented = false
//    @State private var isAudioPickerPresented = false
//    
//    var body: some View {
//        VStack {
//            ZStack {
//                if let videoURL = videoURL {
//                    VideoPlayer(player: AVPlayer(url: videoURL))
//                        .frame(height: 250)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.white, lineWidth: 2)
//                        )
//                } else {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.black.opacity(0.2))
//                        .frame(height: 250)
//                        .overlay(Text("Select a video to edit").foregroundColor(.white))
//                }
//                
//                Button(action: { isVideoPickerPresented.toggle() }) {
//                    Image(systemName: "play.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.white)
//                }
//            }
//            .padding()
//            
//            HStack {
//                Button(action: { isVideoPickerPresented.toggle() }) {
//                    Text("Select Video")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.gray.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                
//                Button(action: { isAudioPickerPresented.toggle() }) {
//                    Text("Add Music")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .disabled(videoURL == nil)
//            }
//            .padding(.horizontal)
//            
//            Button(action: {
//                if let videoURL = videoURL, let audioURL = audioURL {
//                    mergeVideoWithAudio(videoURL: videoURL, audioURL: audioURL)
//                }
//            }) {
//                Text("Save")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal)
//            .disabled(videoURL == nil || audioURL == nil)
//            
//            Spacer()
//        }
//        .background(Color.black.opacity(0.05))
//    }
//    
//    func mergeVideoWithAudio(videoURL: URL, audioURL: URL) {
//        // Implement merging logic using AVFoundation
//    }
//}
//



struct VideoEditorView: View {
    let videoURL: URL

    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(height: 300)

            Text("Add Music Feature Coming Soon...")
        }
        .navigationTitle("Edit Video")
    }
}
