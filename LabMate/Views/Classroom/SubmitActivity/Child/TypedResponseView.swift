//
//  TypedResponseView.swift
//  LabMate
//
//  Created by Euan Mendoza on 15/5/2024.
//

import SwiftUI

struct TypedResponseView: View {
    let action: () -> Void
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Please type your response below:")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.bottom, 4)
            
            //Click, hold and drag to scroll
            ScrollView(.vertical) {
                TextEditor(text: $text)
                    .font(.body)
                    .lineSpacing(5)
                    .frame(minHeight: 100)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: 1)
            )
        }
        Spacer()
        Button(action: action) {
            Text("Submit")
                .font(.body)
                .foregroundColor(.blue)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    @State var text = ""
    return TypedResponseView(action: { }, text: $text)
}
