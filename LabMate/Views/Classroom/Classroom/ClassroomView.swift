//
//  ClassroomView.swift
//  LabMate
//
//  Created by Euan Mendoza on 13/5/2024.
//

import SwiftUI

struct ClassroomView: View {
    @State private var vm: ClassroomViewModel
    
    init(classroom: Classroom) {
        self.vm = ClassroomViewModel(classroom: classroom)
    }
    
    var body: some View {
        VStack {
            AppHeading("Class")
            Spacer()
           
            VStack(alignment: .leading, spacing: 8) {
                Text("Joined class '\(vm.classroom.name)' with code \(vm.classroom.code)")
                    .font(.headline)
                Text("Waiting for activities to start.")
            }
            .onAppear(perform: vm.setup)
            .onDisappear(perform: vm.destroy)

            Spacer()
        }
    }
}

#Preview {
    ClassroomView(classroom: Classroom(id: UUID(), code: "666666", name: "Real Lab", updatedAt: Date()))
}
