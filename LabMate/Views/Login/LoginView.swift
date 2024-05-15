//
//  LoginView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI

struct LoginView: View {
    //@State private var text = ""
    
    @Bindable private var vm = LoginViewModel()
    
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
            AppHeading("Login")
            Spacer()
                .frame(height: 100)
            Section {
                VStack(alignment: .leading) {
                    Text("Enter Email:")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                    TextField("Email address...", text: $vm.email)
                        .autocorrectionDisabled()
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .font(.headline)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(
                            Color.gray
                                .brightness(0.4)
                        )
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            
            if let result = vm.result {
                Section {
                    switch result {
                    case .success:
                        Text("Please check your emails.")
                        
                    case .failure(let error):
                        Text(error.localizedDescription)
                            .foregroundStyle(.red)
                    }
                }
            }
            Spacer().frame(height: 100)
            
            Section {
                Button("Login") {
                    vm.signIn()
                    // signInButtonTapped()
                }.font(.headline)
                
                if vm.isLoading {
                    ProgressView()
                }
            }
            Spacer()
                .frame(height: 280)
            
            
        }.onOpenURL(perform: { url in
            vm.openUrl(url)
        })
    }
}

#Preview {
    LoginView()
}
