//
//  CreateView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = ViewModel()
    @State private var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                VStack() {
                    imageView(for: viewModel.selectedImage)
                    imageControlBar()
                }
                .sheet(isPresented: $viewModel.isPresentingImagePicker, content: {
                    ImagePicker(sourceType: viewModel.sourceType, onImagePicked: viewModel.didSelectImage)
                })
                Spacer()
            }
            
            HStack {
                Text("Nome")
                    .font(.headline)
                TextField("Nome do Quiz", text: $username)
            }
            .padding(.vertical, 50)
            
            HStack {
                Text("Descrição")
                    .font(.headline)
                TextField("Descrição do Quiz", text: $username)
            }
            Spacer()
            
            pageControlBar()
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func imageView(for image: UIImage?) -> some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
        }
        else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
        }
    }
    
    func imageControlBar() -> some View {
        HStack(spacing: 20) {
            Button(action: viewModel.choosePhoto, label: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
            })
            Button(action: viewModel.takePhoto, label: {
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
            })
        }.padding()
    }
    
    func pageControlBar() -> some View {
        HStack() {
            Spacer()
            Button(action: {
                    print("Hello World tapped!")
                }) {
                    Text("Criar Perguntas")
            }
            Spacer()
            Button(action: {
                    print("Hello World tapped!")
                }) {
                    Text("Criar Resultados")
            }
            Spacer()
        }.padding()
    }
}

extension CreateView {
    final class ViewModel: ObservableObject {
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
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

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
