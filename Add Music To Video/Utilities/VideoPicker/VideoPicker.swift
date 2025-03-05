//
//  VideoPicker.swift
//  Add Music To Video
//
//  Created by Tipu Sultan on 3/5/25.
//

import SwiftUI
import PhotosUI

struct VideoPicker: UIViewControllerRepresentable {
    @Binding var selectedVideoURL: URL?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .videos
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: VideoPicker

        init(_ parent: VideoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }
            if provider.hasItemConformingToTypeIdentifier("public.movie") {
                provider.loadFileRepresentation(forTypeIdentifier: "public.movie") { url, error in
                    DispatchQueue.main.async {
                        if let url = url {
                            self.parent.selectedVideoURL = url
                        }
                    }
                }
            }
        }
    }
}
