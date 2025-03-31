//
//  VideoEditorView.swift
//  Add Music To Video
//
//  Created by  Tipu Sultan on 3/4/25.
//

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
