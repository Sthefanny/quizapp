//
//  RadioButton.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

struct RadioButton: View {
    let text: String
    @Binding var isOn: Bool
    var body: some View {
        Button(action: {
            self.isOn.toggle()
        }) {
            HStack(alignment: .top) {
                Circle()
                    .fill(isOn ? .primary : Color.clear)
                    .overlay(Circle().stroke(Color("PurpleColor")))
                    .frame(width: 18, height: 18)
                Text(text)
                    .foregroundColor(Color("PurpleColor"))
            }
        }
        .buttonStyle(RadioButtonStyle())
    }
}
struct RadioButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 4)
            .padding(.horizontal, 8)            .background(Color.clear)
    }
}
