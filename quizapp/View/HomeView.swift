//
//  HomeView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(named: "PurpleColor") ?? UIColor.purple]
    }
    var body: some View {
        VStack {
            Text("Quizator")
                .font(.custom("Futura", size: 60))
                .fontWeight(.bold)
                .foregroundColor(Color("PurpleColor"))
                .padding()
            
            Spacer()
            
            VStack {
                NavigationLink(destination: ListQuizView()
                                .environment(\.managedObjectContext, viewContext)) {
                    Text("Criar Quiz")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 200, height: 65, alignment: .center)
                        .background(Color("PurpleButton"))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("PurpleButton"), lineWidth: 1)
                        )
                    }
                .padding(.bottom, 50)
                
                Button(action: {
                        print("Hello World tapped!")
                    }) {
                        Text("Jogar Quiz")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .frame(width: 200, height: 65, alignment: .center)
                            .background(Color("PurpleButton"))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("PurpleButton"), lineWidth: 1)
                            )
                }
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
