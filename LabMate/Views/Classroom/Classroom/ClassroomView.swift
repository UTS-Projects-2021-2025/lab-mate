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
            Text("Class '\(vm.classroom.name)' with code \(vm.classroom.code)")
            
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ClassroomView(classroom: Classroom(id: UUID(), code: "666666", name: "Real class", updatedAt: Date()))
}
