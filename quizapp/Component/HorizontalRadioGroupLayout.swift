//
//  HorizontalRadioGroupLayout.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 01/08/21.
//

import SwiftUI

struct HorizontalRadioGroupLayout: View {
    @State private var selected = 1
    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selected, label: Text("Favorite Color")) {
                Text("Red").tag(1)
                Text("Green").tag(2)
                Text("Blue").tag(3)
                Text("Other").tag(4)
            }
            .pickerStyle(.radioGroup)

            Picker(selection: $selected, label: Text("Favorite Color")) {
                Text("Red").tag(1)
                Text("Green").tag(2)
                Text("Blue").tag(3)
                Text("Other").tag(4)
            }
            .pickerStyle(.radioGroup)
            .horizontalRadioGroupLayout()
        }
        .padding(20)
        .border(Color.gray)
    }
}
