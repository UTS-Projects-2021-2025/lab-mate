//
//  ContentView.swift
//  LabMate
//
//  Created by Euan Mendoza on 30/4/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isAuthenticated = false
    
    var body: some View {
        Group {
            if isAuthenticated {
                JoinClassroomView()
            } else {
                LoginView()
            }
        }
        .task {
            for await (event, session) in supabase.auth.authStateChanges {
                if [.initialSession, .signedIn, .signedOut].contains(event) {
                    isAuthenticated = session != nil
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
