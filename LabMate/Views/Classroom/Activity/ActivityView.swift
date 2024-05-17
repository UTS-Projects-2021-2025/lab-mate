//
//  ActivityView.swift
//  LabMate
//
//  Created by Euan Mendoza on 17/5/2024.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    
    var body: some View {
        VStack(spacing: 15) {
            AppHeading("Activity")
            Spacer()
            Text(activity.name)
                .font(.headline)
            Text(activity.description)
            NavigationLink("Submit a Response") {
                SubmitActivityView()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let activity = Activity(
        id: UUID(),
        createdAt: Date(),
        name: "DSA Activity 01",
        description: "Prove that P=NP Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        startTime: Date(),
        endTime: Date()
    );
    
    return ActivityView(activity: activity)
}
