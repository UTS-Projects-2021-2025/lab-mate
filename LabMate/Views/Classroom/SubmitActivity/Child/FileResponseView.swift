//
//  FileResponseView.swift
//  LabMate
//
//  Created by Euan Mendoza on 15/5/2024.
//

import SwiftUI

struct FileResponseView: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: action) {
                Text("Upload a File")
                    .font(.body)
                    .foregroundColor(.blue)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    FileResponseView(action: { })
}
