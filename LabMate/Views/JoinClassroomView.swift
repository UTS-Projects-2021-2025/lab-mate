//
//  JoinClassroomView.swift
//  LabMate
//
//  Created by Euan Mendoza on 12/5/2024.
//

import SwiftUI

struct JoinClassroomView: View {
    @Bindable private var vm = JoinClassroomViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Enter Classroom Code")
                .font(.title)
           
            Spacer()
            
            Text(vm.errMsg)
                .foregroundStyle(.red)
            VStack(alignment: .leading) {
                TextField("000000", text: $vm.code)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                Button("Enter Class", action: vm.joinClass)
                
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    JoinClassroomView()
}
