////
////  HomeView.swift
////  Add Music To Video
////
////  Created by  Tipu Sultanon 3/4/25.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Top Bar
//                HStack {
//                    Button(action: {
//                        // Navigate to Settings
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                    Spacer()
//                    Button(action: {
//                        // Navigate to Pro version
//                    }) {
//                        HStack {
//                            Image(systemName: "crown.fill")
//                                .foregroundColor(.purple)
//                            Text("PRO")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                        }
//                        .padding()
//                        .background(Color.purple.opacity(0.2))
//                        .cornerRadius(10)
//                    }
//                }
//                .padding(.horizontal)
//                
//                // Advertisement Banner
//                Image("ad_banner") // Replace with actual image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(height: 350)
//                    .cornerRadius(10)
//                    .padding()
//                
//                
//                Spacer()
//                // Main Button
//                NavigationLink(destination: AddMusicView()) {
//                    HStack {
//                        Image(systemName: "music.note")
//                            .foregroundColor(.orange)
//                        Text("Add Music to Video")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                    }
//                    .frame(maxWidth: .infinity, minHeight: 50)
//                    .background(Color.gray.opacity(0.8))
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                }
//                
//                // Grid of Feature Buttons
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
//                    FeatureButton(title: "AI Effects", icon: "sparkles", color: .orange)
//                    FeatureButton(title: "Slow Motion", icon: "speedometer", color: .pink)
//                    FeatureButton(title: "Cut Video", icon: "scissors", color: .green)
//                    FeatureButton(title: "Cut Audio", icon: "music.note.list", color: .yellow)
//                    FeatureButton(title: "Merge Audio", icon: "music.quarternote.3", color: .purple)
//                    FeatureButton(title: "Extract Audio", icon: "square.and.arrow.down", color: .blue)
//                }
//                .padding()
//                
//                Spacer()
//            }
//            .background(Color.black.edgesIgnoringSafeArea(.all))
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct FeatureButton: View {
//    var title: String
//    var icon: String
//    var color: Color
//    
//    var body: some View {
//        NavigationLink(destination: Text("\(title) Page")) {
//            HStack {
//                Image(systemName: icon)
//                    .foregroundColor(color)
//                Text(title)
//                    .foregroundColor(.white)
//            }
//            .frame(maxWidth: .infinity, minHeight: 50)
//            .background(Color.gray.opacity(0.3))
//            .cornerRadius(10)
//        }
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


import SwiftUI
import PhotosUI

struct HomeView: View {
    @State private var selectedVideoURL: URL? = nil
    @State private var isVideoPickerPresented = false
    @State private var navigateToDestination = false
    @State private var destinationView: AnyView? = nil

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
                Button(action: {
                    isVideoPickerPresented = true
                    destinationView = AnyView(AddMusicView(videoURL: selectedVideoURL))
                }) {
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
            .sheet(isPresented: $isVideoPickerPresented, onDismiss: {
                if selectedVideoURL != nil, let destination = destinationView {
                    navigateToDestination = true // ✅ Trigger navigation
                }
            }) {
                VideoPicker(selectedVideoURL: $selectedVideoURL)
            }
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
