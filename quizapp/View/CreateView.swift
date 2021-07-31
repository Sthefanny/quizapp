//
//  CreateView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import SwiftUI

struct CreateView: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Nome do Quiz")
                    .font(.headline)
                TextField("Nome do Quiz", text: $username)
            }
            
            HStack {
                Text("Nome do Quiz")
                    .font(.headline)
                TextField("Nome do Quiz", text: $username)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
