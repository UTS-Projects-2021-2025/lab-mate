//
//  CodeTextField.swift
//  LabMate
//
//  Created by Euan Mendoza on 12/5/2024.
//

import SwiftUI

struct CodeTextField: View {
    @Binding var code: String
    var index: Int
    
    var body: some View {
        TextField("", text: Binding(
            get: {
                return index < code.count ? String(code[code.index(code.startIndex, offsetBy: index)]) : ""
            },
            set: {
                if $0.isEmpty {
                    if index < code.count {
                        
                    }
                }
            }))
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @State var text = ""
    return CodeTextField(code: $text, index: 0)
}
