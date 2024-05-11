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
        HomeView()
      } else {
        LoginView()
      }
    }
    .task {
      for await state in await supabase.auth.authStateChanges {
        if [.initialSession, .signedIn, .signedOut].contains(state.event) {
          isAuthenticated = state.session != nil
        }
      }
    }
    }
}

#Preview {
    ContentView()
}
