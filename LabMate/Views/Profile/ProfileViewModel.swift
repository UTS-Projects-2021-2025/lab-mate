//
//  ProfileViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import Foundation
import PhotosUI
import SwiftUI

@Observable
class ProfileViewModel {
    var username = ""
    var fullName = ""
    
    var imageSelection: PhotosPickerItem?
    var avatarImage: AvatarImage?
    
    var isLoading = false
    
    init() {}
    
    func getInitialProfile() async {
        do {
            let currentUser = try await supabase.auth.session.user
            
            let profile: Profile = try await supabase
                .from("profiles")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value
            
            self.username = profile.username ?? ""
            self.fullName = profile.fullName ?? ""
        } catch {
            debugPrint(error)
        }
    }
    
    func updateProfileButtonTapped() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                let currentUser = try await supabase.auth.session.user
                
                try await supabase
                    .from("profiles")
                    .update(
                        (UpdateProfileParams(username: username, fullName: fullName)
                        )
                    )
                    .eq("id", value: currentUser.id)
                    .execute()
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func signOut() {
        Task {
            try? await supabase.auth.signOut()
        }
    }
}
