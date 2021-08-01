//
//  CreateView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var quizModel = QuizModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack() {
                    Spacer()
                    VStack() {
                        imageView(for: quizModel.selectedImage)
                        imageControlBar()
                    }
                    .sheet(isPresented: $quizModel.isPresentingImagePicker, content: {
                        ImagePicker(sourceType: quizModel.sourceType, onImagePicked: quizModel.didSelectImage)
                    })
                    Spacer()
                }
                
                HStack {
                    Text("Nome")
                        .font(.headline)
                        .foregroundColor(quizModel.nameHasError ? .red : .black)
                    TextField("Nome do Quiz", text: $quizModel.name)
                }
                .padding(.vertical, 50)
                
                HStack {
                    Text("Descrição")
                        .font(.headline)
                    TextField("Descrição do Quiz", text: $quizModel.text)
                }
                Spacer()
                
                pageControlBar()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarTitle(Text("Criar Quiz"))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Salvar") {
                    SaveData()
                }
            }
        }
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
            Button(action: quizModel.choosePhoto, label: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
            })
            Button(action: quizModel.takePhoto, label: {
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
                        .foregroundColor(quizModel.isSaved ? Color("PurpleButton") : Color("DisabledColor"))
            }
            Spacer()
            Button(action: {
                    print("Hello World tapped!")
                }) {
                    Text("Criar Resultados")
                        .foregroundColor(quizModel.isSaved ? Color("PurpleButton") : Color("DisabledColor"))
            }
            Spacer()
        }.padding()
    }
    
    func SaveData() {
        quizModel.nameHasError = false

        withAnimation {
            if quizModel.name != "" {
                quizModel.nameHasError = false
                let imageData = quizModel.selectedImage?.pngData()
                let newQuiz = Quiz(context: viewContext)
                newQuiz.name = quizModel.name
                newQuiz.text = quizModel.text
                newQuiz.image = imageData

                do {
                    try viewContext.save()
                    print(NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).last!);
                    quizModel.isSaved = true
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
            else {
                quizModel.nameHasError = true
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
