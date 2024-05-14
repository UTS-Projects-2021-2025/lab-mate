//
//  SubmitActivityView.swift
//  LabMate
//
//  Created by Noah on 14/5/2024.
//

import SwiftUI

struct SubmitActivityView: View {
    @State private var submissionSelection = "File Upload" // Default selection
    @State private var typedResponse: String = ""
    
    var body: some View {
        VStack {
            Text("Submit Activity")
                .font(.title)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text("Please submit completed activity using the options below.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("Submission types accepted: file upload or typed response.")
                .font(.footnote)
                .padding(.bottom, 10)
            
            Picker(selection: $submissionSelection, label: Text("")) {
                Text("File Upload").tag("File Upload")
                Text("Typed Response").tag("Typed Response")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 10)
            
            if submissionSelection == "Typed Response" {
                TypedResponseView(text: $typedResponse)
                    .padding(.horizontal)
            } else {
                Spacer()
                Button(action: {
                    // Upload a File button functionality here
                }) {
                    Text("Upload a File")
                        .font(.body)
                        .foregroundColor(.blue)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                }
                .padding(.horizontal)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct TypedResponseView: View {
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
    }
}


#Preview {
    SubmitActivityView()
}

