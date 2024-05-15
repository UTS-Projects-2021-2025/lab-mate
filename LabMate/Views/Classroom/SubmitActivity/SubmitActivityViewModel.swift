//
//  SubmitActivityViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import Foundation

enum SubmissionSelections: String, CaseIterable, Identifiable {
    case typedSelection, fileInputSelection
    var id: Self { self }
}

@Observable
class SubmitActivityViewModel {
    var typedResponse = ""
    var submissionSelection = SubmissionSelections.fileInputSelection
    
    init() {}
    
    func submitFile() {
        // TODO: Create submit file functionality
    }
}
