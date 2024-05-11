//
//  HomeView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack  {
      HStack {
        Text("LabMate")
          .foregroundColor(.black)
          .font(.largeTitle)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity)
          .padding()
      }
      Spacer()
      Section {
        Text("WELCOME")
          .foregroundColor(.black)
          .font(.largeTitle)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity)
          .padding()
      }
      Spacer()
        .frame(height: 50)
      Section {
        Button("Login") {
        }
          .font(.title)
      }
      Spacer()
    }
  }
}
#Preview {
    HomeView()
}