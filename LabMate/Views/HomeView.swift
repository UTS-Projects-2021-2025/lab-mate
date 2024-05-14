//
//  HomeView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            JoinClassroomView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DummyView()
                .tabItem {
                    Label("Profile Stats", systemImage: "person.3")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
#Preview {
    HomeView()
}
