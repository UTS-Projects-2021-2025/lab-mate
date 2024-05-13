//
//  LoginViewModel.swift
//  LabMate
//
//  Created by Christie on 9/5/2024.
//

//import SwiftUI
import Foundation
import Supabase

@Observable
class LoginViewModel {
    var email = ""
    var isLoading = false
    var result:  Result<Void, Error>?

    init() {
        result = nil
    }

    func openUrl(_ url : URL) {
        Task {
            do {
                try await supabase.auth.session(from: url)
            } catch {
                result = .failure(error)
            }
        }
    }

    func signIn() {
        Task {
            isLoading = true
            defer { isLoading = false }

            do {
                if email.isEmpty {
                    return
                }
                
                print("Email: \(email)")

                try await supabase.auth.signInWithOTP(
                  email: email,
                  redirectTo: URL(string: "au.edu.uts.lab-mate://login-callback"))
                
                result = .success(())
            } catch {
                result = .failure(error)
            }
        }
    }
}
