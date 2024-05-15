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
    
    @Bindable private var vm = SubmitActivityViewModel()
    
    var body: some View {
        VStack {
            AppHeading("Submit Activity")
            
            Text("Please submit completed activity using the options below.")
                .font(.body)
                .padding(.bottom, 10)
            
            Text("Submission types accepted: file upload or typed response.")
                .font(.footnote)
                .padding(.bottom, 10)
            
            Picker(selection: $vm.submissionSelection, label: EmptyView()) {
                Text("File Upload").tag(SubmissionSelections.fileInputSelection)
                Text("Typed Response").tag(SubmissionSelections.typedSelection)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 10)
            
            if vm.submissionSelection == .typedSelection {
                TypedResponseView(text: $typedResponse)
                    .padding(.horizontal)
            } else {
                FileResponseView(action: vm.submitFile)
            }
            
            Spacer()
        }
    }
}

#Preview {
    SubmitActivityView()
}

