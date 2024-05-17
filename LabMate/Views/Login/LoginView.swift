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
                    .font(.largeTitle)
<<<<<<< HEAD
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Image(.labMateLogo)
                    .resizable()
                    .frame(maxWidth: 55, maxHeight: 55)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
                
||||||| e205d7e
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
=======
                    .fontWeight(.semibold)
                    .fontDesign(.monospaced)
                    .padding(.top, 20)
                Image(.labMateLogo)
                    .resizable()
                    .frame(maxWidth: 55, maxHeight: 55)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
>>>>>>> dev/euan
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
                        .foregroundColor(.black)
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
