//
//  QuestionModel.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

extension CreateEditQuestionsView {
    final class QuestionModel: ObservableObject {
        @Published var text: String = ""
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
        @Published var isSaved = false
        @Published var textHasError = false
        @Published var imageHasError = false
        @Published var timestamp = Date()
        @Published var options = [OptionModel(),
                                  OptionModel(),
                                  OptionModel(),
                                  OptionModel()]
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
