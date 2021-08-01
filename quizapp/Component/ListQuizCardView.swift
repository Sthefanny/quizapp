//
//  ListQuizCardView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

struct ListQuizCardView: View {
    let quiz: Quiz
    
    @State private var optionalData = UIImage(systemName: "photo")?.jpegData(compressionQuality: 1)
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(uiImage: UIImage(data: (quiz.image ?? optionalData)!)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .padding(0)
                
                VStack(alignment: .leading) {
                    Text(quiz.name ?? "")
                        .font(.headline)
                    
                    HStack {
                        Text("\(quiz.text ?? "")")
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Spacer()
                        Text("\(quiz.timestamp ?? Date(), formatter: FormatDate.format)")
                            .font(.system(size: 10))
                    }
                    .padding(.top, 10)
                    
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
            }
        }
        .padding(.horizontal)
    }

}

struct ListQuizCardView_Previews: PreviewProvider {
    static var quiz = Quiz()
    static var previews: some View {
        ListQuizCardView(quiz: quiz)
    }
}
