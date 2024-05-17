//
//  ProfileView.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//
import SwiftUI
import PhotosUI

struct ProfileView: View {
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
                        Group {
                            if let avatarImage = vm.avatarImage {
                                avatarImage.image.resizable()
                            } else {
                                Color.clear
                            }
                         }
                         .scaledToFit()
                         .frame(width: 80, height: 80)
                         
                        Spacer()
                        
                        PhotosPicker(selection: $imageSelection, matching: .images) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 30))
                                .foregroundColor(.accentColor)
                        }
                    }
                }
                Section {
                    TextField("Username", text: $vm.fullName)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                    TextField("Fullname", text: $vm.username)
                        .textContentType(.name)
                }
                
                if vm.isLoading {
                    ProgressView()
                }
                
                Button("Update Profile", action: vm.updateProfileButtonTapped)
                
                Section{
                    Button("Sign out", role: .destructive, action: vm.signOut)
                }
            }
        }
        .task {
            await vm.getInitialProfile()
        }
    }
}

#Preview {
    ProfileView()
}
