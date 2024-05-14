//
//  ProfileView.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import SwiftUI

struct ProfileView: View {
    //@State var username = ""
    @Bindable private var vm = ProfileViewModel()
    
    var body: some View {
        VStack {
            AppHeading("Profile")
            Spacer()
            Form {
                Section {
                    TextField("Username", text: $vm.username)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                }
                Button("Sign out", role: .destructive, action: vm.signOut)
            }
        }
    }
}

#Preview {
    ProfileView()
}
