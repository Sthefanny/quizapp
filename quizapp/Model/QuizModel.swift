//
//  QuizModel.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

extension CreateView {
    final class QuizModel: ObservableObject {
        @Published var name: String = ""
        @Published var text: String = ""
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
        @Published var isSaved = false
        @Published var nameHasError = false
        private(set) var sourceType: ImagePicker.SourceType = .camera
        
        func choosePhoto() {
            sourceType = .photoLibrary
            isPresentingImagePicker = true
        }
        
        func takePhoto() {
            sourceType = .camera
            isPresentingImagePicker = true
        }
        
        func didSelectImage(_ image: UIImage?) {
            selectedImage = image
            isPresentingImagePicker = false
        }
    }
}
