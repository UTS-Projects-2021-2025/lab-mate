//
//  ProfileView.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//
import PhotosUI
import SwiftUI

struct ProfileView: View {
    //@State var username = ""
    @State private var text = ""
    @State var imageSelection: PhotosPickerItem?
    //@State var avatarImage: AvatarImage?
    @Bindable private var vm = ProfileViewModel()
    
    var body: some View {
        VStack {
            AppHeading("Profile")
            Spacer()
            Form {
                Section {
                    HStack {
                    /*Group {
                        if let avatarImage {
                            avatarImage.image.resizable()
                        } else {
                            Color.clear
                        }
                    }
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                                            
                    Spacer() */
                    PhotosPicker(selection: $imageSelection, matching: .images) {
                        Image(systemName: "pencil.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 30))
                            .foregroundColor(.accentColor)
                        }
                    }
                }
                Section {
                    TextField("Username", text: $text)
                }
                Section {
                    TextField("Fullname", text: $vm.username)
                }
                .textContentType(.username)
                .textInputAutocapitalization(.never)
        
                Button("Sign out", role: .destructive, action: vm.signOut)
            }
            Section {
                Button("Update profile") {
                }
            }
            Section {
                Button("Sign out", role: .destructive, action: vm.signOut)
            }
        }
    }
}

#Preview {
    ProfileView()
}
