//
//  JoinClassroomView.swift
//  LabMate
//
//  Created by Euan Mendoza on 12/5/2024.
//

import SwiftUI

struct JoinClassroomView: View {
    @Bindable private var vm = JoinClassroomViewModel()
    @FocusState private var codeIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                AppHeading("Join Classroom")
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Section("Enter Classroom Code") {
                        Text(vm.errMsg)
                            .foregroundStyle(.red)
                        TextField("000000", text: $vm.code)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .focused($codeIsFocused)
                        Button("Enter Class", action: vm.toClass).onTapGesture {
                            codeIsFocused = false
                        }
                        //NavigationLink("Enter Class", value: vm.code)
                    }.navigationDestination(isPresented: $vm.hasClassroom) {
                        if let clsrm = vm.classroom {
                            return ClassroomView(classroom: clsrm)
                        }
                        
                        return ClassroomView(classroom: Classroom(id: UUID(), code: vm.code, name: "Fake Class", updatedAt: Date()))
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    JoinClassroomView()
}
