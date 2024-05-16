//
//  CameraView.swift
//  LabMate
//
//  Created by Noah Koshy on 15/5/2024.
//

import SwiftUI

struct CameraView: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: action) {
                Text("Upload a Photo")
                    .font(.body)
                    .foregroundColor(.blue)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
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
}

#Preview {
    CameraView(action: { })
}
