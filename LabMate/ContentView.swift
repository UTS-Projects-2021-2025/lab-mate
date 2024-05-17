//
//  ContentView.swift
//  LabMate
//
//  Created by Euan Mendoza on 30/4/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isAuthenticated = false
    @State var isLoading = false
    
    var body: some View {
        Group {
            if isAuthenticated {
                HomeView()
            } else if isLoading {
                LogoView()
            } else {
                LoginView()
            }
        }
        .task {
            isLoading = true
            
            for await (event, session) in supabase.auth.authStateChanges {
                if [.initialSession, .signedIn, .signedOut].contains(event) {
                    isAuthenticated = session != nil
                    isLoading = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
