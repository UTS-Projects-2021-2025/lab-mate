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
        }.navigationDestination(isPresented: $vm.hasCurrentActivity) {
            if let activity = vm.getCurrentActivity() {
                return ActivityView(activity: activity)
            }
            
            let activity = Activity(
                id: UUID(),
                createdAt: Date(),
                name: "DSA Activity 01",
                description: "Prove that P=NP fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                startTime: Date(),
                endTime: Date()
            );
            return ActivityView(activity: activity)
        }
    }
}

#Preview {
    ClassroomView(classroom: Classroom(id: UUID(), code: "666666", name: "Real Lab", updatedAt: Date()))
}
