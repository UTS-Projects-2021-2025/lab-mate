//
//  SubmitActivityView.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

// TODO: Noah
// create submit activity view for files and multi choice-questions

import SwiftUI

struct SubmitActivityView: View {
    @Bindable private var vm = SubmitActivityViewModel()
    
    var body: some View {
        VStack {
            AppHeading("Submit Activity")
        }
    }
}

#Preview {
    SubmitActivityView()
}
