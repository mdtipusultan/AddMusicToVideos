//
//  HomeView.swift
//  Add Music To Video
//
//  Created by  Tipu Sultan on 3/4/25.
//

import SwiftUI
import PhotosUI
import _AVKit_SwiftUI

struct HomeView: View {
    @State private var selectedVideoURL: URL? = nil
    @State private var isVideoPickerPresented = false
    @State private var navigateToDestination = false
    @State private var destinationView: AnyView? = nil
    @State private var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                // Top Bar
                HStack {
                    Button(action: {
                        // Navigate to Settings
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        // Navigate to Pro version
                    }) {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.purple)
                            Text("PRO")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                // Advertisement Banner
                Image("ad_banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 350)
                    .cornerRadius(10)
                    .padding()
                
                Spacer()
                // ✅ **Main Button: Add Music to Video**
                PhotosPicker(selection: $selectedItem, matching: .videos) {
                    HStack {
                        Image(systemName: "music.note")
                            .foregroundColor(.orange)
                        Text("Add Music to Video")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let tempURL = saveVideoToTempDirectory(data: data) {
                                selectedVideoURL = tempURL
                                destinationView = AnyView(VideoEditorView(videoURL: tempURL))
                                navigateToDestination = true
                            }
                        }
                    }
                
                // ✅ **Navigation Trigger**
                NavigationLink(destination: destinationView, isActive: $navigateToDestination) {
                    EmptyView()
                }
                
                // ✅ **Grid of Feature Buttons**
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    FeatureButton(title: "AI Effects", icon: "sparkles", color: .orange, destination: AnyView(AIEffectsView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                    FeatureButton(title: "Slow Motion", icon: "speedometer", color: .pink, destination: AnyView(SlowMotionView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                    FeatureButton(title: "Cut Video", icon: "scissors", color: .green, destination: AnyView(CutVideoView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                    FeatureButton(title: "Cut Audio", icon: "music.note.list", color: .yellow, destination: AnyView(CutAudioView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                    FeatureButton(title: "Merge Audio", icon: "music.quarternote.3", color: .purple, destination: AnyView(MergeAudioView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                    FeatureButton(title: "Extract Audio", icon: "square.and.arrow.down", color: .blue, destination: AnyView(ExtractAudioView()), selectedVideoURL: $selectedVideoURL, isVideoPickerPresented: $isVideoPickerPresented, navigateToDestination: $navigateToDestination, destinationView: $destinationView)
                }
                .padding()

                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
    
    func saveVideoToTempDirectory(data: Data) -> URL? {
        let tempDirectory = FileManager.default.temporaryDirectory
        let tempFileURL = tempDirectory.appendingPathComponent("selected_video.mp4")
        
        do {
            try data.write(to: tempFileURL)
            return tempFileURL
        } catch {
            print("Error saving video: \(error)")
            return nil
        }
    }
}


// ✅ **Updated Feature Button**
struct FeatureButton: View {
    var title: String
    var icon: String
    var color: Color
    var destination: AnyView
    @Binding var selectedVideoURL: URL?
    @Binding var isVideoPickerPresented: Bool
    @Binding var navigateToDestination: Bool
    @Binding var destinationView: AnyView?

    var body: some View {
        Button(action: {
            isVideoPickerPresented = true
            destinationView = destination
        }) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
        }
    }
}
