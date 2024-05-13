//
//  HomeView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
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
                    NavigationLink(destination: LoginView()) {
                            Text("Login")
                        }
                    .font(.title)
                }
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    HomeView()
}
