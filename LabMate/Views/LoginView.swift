//
//  LoginView.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

import SwiftUI
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://iekusptxjllpvmilfoio.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlla3VzcHR4amxscHZtaWxmb2lvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1MTg1MjIsImV4cCI6MjAyNzA5NDUyMn0.ZdrL7lqxydOXA1ih1eNCyAYfUHII-vLmn54UpgGQn7g"
)

struct LoginView: View {
  @State var email = ""
  @State var isLoading = false
  @State var result: Result<Void, Error>?
  @State private var text = ""

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
        TextField("Email address...", text: $email)
          .font(.headline)
          .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
          .background(
            Color.gray
              .brightness(0.4)
          )
          .padding(EdgeInsets(top: 0, leading: 30, bottom: 15, trailing: 30))
          .textContentType(.emailAddress)
          .textInputAutocapitalization(.never)
          .autocorrectionDisabled()
      }
      Spacer()
        .frame(height: 130)
      Section {
        Button("Submit") {
          // signInButtonTapped()
        }
        .font(.headline)
        /*if isLoading {
          ProgressView()
        }*/
      } 
      Spacer()
        .frame(height: 280)
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
    /*.onOpenURL(perform: { url in
      Task {
        do {
          try await supabase.auth.session(from: url)
        } catch {
          self.result = .failure(error)
        }
      }
    }) */
  }
/*  func signInButtonTapped() {
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
}
#Preview {
    LoginView()
}