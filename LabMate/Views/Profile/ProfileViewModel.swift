//
//  ProfileViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import Foundation

@Observable
class ProfileViewModel {
    var username = ""
    
    init() {}
    
    func signOut() {
        Task {
            try? await supabase.auth.signOut()
        }
    }
}
