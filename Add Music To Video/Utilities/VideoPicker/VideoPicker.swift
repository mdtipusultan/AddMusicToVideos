////
////  VideoPicker.swift
////  Add Music To Video
////
////  Created by Tipu Sultan on 3/5/25.
////
//
//import SwiftUI
//import PhotosUI
//
//struct VideoPicker: UIViewControllerRepresentable {
//    @Binding var selectedVideoURL: URL?
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var config = PHPickerConfiguration()
//        config.filter = .videos
//        config.selectionLimit = 1
//
//        let picker = PHPickerViewController(configuration: config)
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        let parent: VideoPicker
//
//        init(_ parent: VideoPicker) {
//            self.parent = parent
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            picker.dismiss(animated: true)
//
//            guard let provider = results.first?.itemProvider else { return }
//            if provider.hasItemConformingToTypeIdentifier("public.movie") {
//                provider.loadFileRepresentation(forTypeIdentifier: "public.movie") { url, error in
//                    DispatchQueue.main.async {
//                        if let url = url {
//                            self.parent.selectedVideoURL = url
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//


import SwiftUI
import PhotosUI

struct VideoPicker: UIViewControllerRepresentable {
    @Binding var videoURL: URL?
    @Binding var isPresented: Bool
    @Binding var isEditViewActive: Bool

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: VideoPicker

        init(parent: VideoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false
            
            guard let provider = results.first?.itemProvider else {
                print("No video selected")
                return
            }
            
            if provider.hasItemConformingToTypeIdentifier("public.movie") {
                provider.loadInPlaceFileRepresentation(forTypeIdentifier: "public.movie") { tempURL, inPlace, error in
                    if let error = error {
                        print("Error loading video: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let tempURL = tempURL else {
                        print("Failed to retrieve video URL")
                        return
                    }

                    print("Temp Video URL: \(tempURL.path)")

                    // Move video to a safe location
                    if let savedURL = self.saveVideoToDocuments(tempURL) {
                        DispatchQueue.main.async {
                            self.parent.videoURL = savedURL
                            self.parent.isEditViewActive = true
                        }
                    } else {
                        print("Failed to save video")
                    }
                }
            }
        }

        /// Copies the video to the Documents directory
        func saveVideoToDocuments(_ tempURL: URL) -> URL? {
            let fileManager = FileManager.default
            let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let newURL = documents.appendingPathComponent(tempURL.lastPathComponent)

            do {
                if fileManager.fileExists(atPath: newURL.path) {
                    try fileManager.removeItem(at: newURL)
                }
                try fileManager.copyItem(at: tempURL, to: newURL)
                print("Video saved successfully at: \(newURL.path)")
                return newURL
            } catch {
                print("Error saving video: \(error)")
                return nil
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .videos
        configuration.selectionLimit = 1

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}
