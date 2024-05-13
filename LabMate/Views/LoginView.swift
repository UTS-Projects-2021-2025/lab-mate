//
//  LoginView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI

struct LoginView: View {
    //@State var email = ""
    //@State var isLoading = false
    //@State var result: Result<Void, Error>?
    @State private var text = ""
    
    @Bindable private var vm = LoginViewModel()
    
    var body: some View {
        VStack  {
            HStack {
                Text("Login")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            Spacer()
                .frame(height: 80)
            Section {
                VStack(alignment: .leading) {
                    Text("Enter Email:")
                    
                    TextField("Email address...", text: $vm.email)
                        .autocorrectionDisabled()
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                    
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
            
            //Spacer().frame(height: 130)
            
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

/*
 Section {
 Button("Join Classroom Without Logging In") {
 }
 .font(.headline)
 }
 NavigationView{
 TextEditor(text: $text)
 .toolbar {
 ToolbarItemGroup(placement:
 .bottomBar) {
 Button {
 } label: {
 Image(systemName: "house")
 .font(.largeTitle)
 }
 }
 }
 }
 }
 
 
 */

/*.onOpenURL(perform: { url in
 Task {
 do {
 try await supabase.auth.session(from: url)
 } catch {
 self.result = .failure(error)
 }
 }
 })
 }
 
 func signInButtonTapped() {
 Task {
 isLoading = true
 defer { isLoading = false }
 
 do {
 try await supabase.auth.signInWithOTP(
 email: email,
 redirectTo: URL(string: "io.supabase.user-management://login-callback")
 )
 result = .success(())
 } catch {
 result = .failure(error)
 }
 }
 }*/
#Preview {
    LoginView()
}
