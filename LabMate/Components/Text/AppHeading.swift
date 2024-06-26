//
//  AppHeading.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import SwiftUI

struct AppHeading: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                //.foregroundColor(.black)
        }
    }
}

#Preview {
    AppHeading("Hello")
}
