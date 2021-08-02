//
//  CreateEditQuestionsView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

struct CreateEditQuestionsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let quiz: Quiz?
    let question: Question?
    @State private var selected = 0
    @State var option1: String = ""
    @State var option2: String = ""
    @State var option3: String = ""
    @State var option4: String = ""
    
    @StateObject var questionModel = QuestionModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack() {
                    Spacer()
                    VStack() {
                        imageView(for: questionModel.selectedImage)
                        imageControlBar()
                    }
                    .sheet(isPresented: $questionModel.isPresentingImagePicker, content: {
                        ImagePicker(sourceType: questionModel.sourceType, onImagePicked: questionModel.didSelectImage)
                    })
                    Spacer()
                }
                
                HStack {
                    Text("Pergunta")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    TextField("Pergunta do Quiz", text: $questionModel.text)
                }
                
                Text("")
                    .padding(.vertical, 20)
            
                HStack {
                    Text("Opção 01")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    
                    TextField("Opção 01", text: $option1)
                }
                
                HStack {
                    Text("Opção 02")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    
                    TextField("Opção 02", text: $option2)
                }
                
                HStack {
                    Text("Opção 03")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    
                    TextField("Opção 03", text: $option3)
                }
                
                HStack {
                    Text("Opção 04")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    
                    TextField("Opção 04", text: $option4)
                }
                
                Text("")
                    .padding(.vertical, 20)
                
                HStack {
                    Text("Opção Correta")
                        .font(.headline)
                        .foregroundColor(questionModel.textHasError ? .red : .black)
                    Picker(selection: $selected, label: Text("Opção Correta")) {
                        ForEach(1..<5) { item in
                            Text("0\(item)").tag(item)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationBarTitle(Text(question == nil ? "Criar Pergunta" : "Editar Pergunta"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        SaveData()
                    }
                }
            }
            .onAppear(perform: {
                if question != nil {
                    questionModel.text = question!.text ?? ""
                    questionModel.timestamp = question!.timestamp ?? Date()
                    questionModel.selectedImage = question!.image != nil ? UIImage(data: question!.image!) : nil
                    questionModel.isSaved = true
                }
        })
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
                .foregroundColor(Color("DisabledColor"))
        }
    }
    
    func imageControlBar() -> some View {
        HStack(spacing: 20) {
            Button(action: questionModel.choosePhoto, label: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
            })
            Button(action: questionModel.takePhoto, label: {
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
            })
        }.padding()
    }
    
    func SaveData() {
        questionModel.textHasError = false
        questionModel.imageHasError = false

        withAnimation {
            if questionModel.text != "" || questionModel.selectedImage != nil {
                questionModel.textHasError = false
                questionModel.imageHasError = false
                let imageData = questionModel.selectedImage?.pngData()
                
                let newQuestion = Question(context: viewContext)
                newQuestion.text = questionModel.text
                newQuestion.image = imageData
                
                newQuestion.quiz = self.quiz
                newQuestion.options = [self.option1, self.option2, self.option3, self.option4]

                do {
                    try viewContext.save()
                    print(NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).last!);
                    questionModel.isSaved = true
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
            else {
                if questionModel.text == "" {
                    questionModel.textHasError = true
                }
                if questionModel.selectedImage == nil {
                    questionModel.imageHasError = true
                }
            }
        }
    }
}

struct CreateEditQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEditQuestionsView(quiz: Quiz(), question: Question())
    }
}
