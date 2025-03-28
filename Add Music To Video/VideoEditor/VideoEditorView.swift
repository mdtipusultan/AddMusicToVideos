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



//struct VideoEditorView: View {
//    let videoURL: URL
//
//    var body: some View {
//        VStack {
//            VideoPlayer(player: AVPlayer(url: videoURL))
//                .frame(height: 300)
//
//            Text("Add Music Feature Coming Soon...")
//        }
//        .navigationTitle("Edit Video")
//    }
//}

import SwiftUI
import AVKit

struct VideoEditorView: View {
    let videoURL: URL
    @State private var isMuted: Bool = false
    
    var body: some View {
        VStack {
            // Video Preview with Overlay Elements
            ZStack {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 250)
                    .overlay(
                        VStack {
                            HStack {
                                Button("New") {
                                    // Handle New button action
                                }
                                .padding()
                                .background(Color.gray.opacity(0.6))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                Spacer()
                                Button("Save") {
                                    // Handle Save button action
                                }
                                .padding()
                                .background(Color.gray.opacity(0.6))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                    )
            }
            .background(Color.black)
            
            // Video Timeline with Controls
            VStack {
                HStack {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Button(action: {
                        isMuted.toggle()
                    }) {
                        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
                
                // Progress Bar
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 2)
                    .padding(.horizontal)
            }
            .padding()
            
            Spacer()
            
            // Bottom Toolbar with Horizontal Scrolling
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ToolbarButton(title: "Effects", icon: "sparkles")
                    ToolbarButton(title: "Canvas", icon: "rectangle.on.rectangle")
                    ToolbarButton(title: "Add Music", icon: "plus", highlight: true)
                    ToolbarButton(title: "Filters", icon: "slider.horizontal.3")
                    ToolbarButton(title: "Edit", icon: "scissors")
                    ToolbarButton(title: "Effects", icon: "sparkles")
                    ToolbarButton(title: "Canvas", icon: "rectangle.on.rectangle")
                    ToolbarButton(title: "Add Music", icon: "plus", highlight: true)
                    ToolbarButton(title: "Filters", icon: "slider.horizontal.3")
                    ToolbarButton(title: "Edit", icon: "scissors")
                    
                }
                .padding(.horizontal)
            }
            .frame(height: 80)
            .background(Color.black)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ToolbarButton: View {
    var title: String
    var icon: String
    var highlight: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(highlight ? .orange : .white)
                .padding()
                .background(highlight ? Color.orange.opacity(0.2) : Color.clear)
                .cornerRadius(10)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(width: 80)
    }
}
