//
//  TeacherProfileView.swift
//  LabMate
//
//  Created by Christie on 11/5/2024.
//

import SwiftUI

struct TeacherProfileView: View {
    @State private var text = ""
    @State var classroomname = ""
    
    struct Lab: Identifiable {
        let id = UUID()
        let labname: String
        let labstart: String
        let labend: String
        let lablocation: String
    }
    let labs = [
        Lab(labname: "1", labstart: "16:00", labend: "17:00", lablocation: "Sydney"),
        Lab(labname: "2", labstart: "17:30", labend: "18:00", lablocation: "Africa")
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Teacher\n  Profile")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
        Button("Create New Classroom") {
            
        }
        .font(.title)
        Spacer()
            .frame(height: 30)
        Section {
            TextField("Classroom Name...", text: $classroomname)
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
            .frame(height: 30)
        Button {
        } label: {
                Image(systemName: "plus")
                .font(.largeTitle)
            }
        Spacer()
            .frame(height: 30)
        VStack (spacing: -10) {
            Text("History:")
                .foregroundColor(.black)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        Grid {
            GridRow {
                Text("Lab Name")
                Text("Start")
                Text("End")
                Text("Location")
            }
            .bold()
            Divider()
            ForEach(labs) { lab in
                GridRow {
                    Text(lab.labname)
                    Text(lab.labstart)
                    Text(lab.labend)
                    Text(lab.lablocation)
                }
            }
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
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                                Button {
                                } label: {
                                    Image(systemName: "person.3")
                                        .font(.largeTitle)
                                    
                                }
                                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                                Button {
                                } label: {
                                    Image(systemName: "person.crop.circle")
                                        .font(.largeTitle)
                                }
                                .disabled(true)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                            }
                }
        }
    }
}
#Preview {
    TeacherProfileView()
}
