//
//  StudentProfileView.swift
//  LabMate
//
//  Created by Christie on 11/5/2024.
//

import SwiftUI

struct StudentProfileView: View {
    @State private var text = ""
    
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
        NavigationStack{
            VStack {
                HStack {
                    Text("Student\n  Profile")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            Text("Personal Statistics:")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack (spacing: -10) {
                Text("Responses Submitted:")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Correct Responses:")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Average Time: Hours:")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("                               Minutes:")
                    .foregroundColor(.black)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
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
            TextEditor(text: $text)
                .toolbar {
                    ToolbarItemGroup(placement:
                        .bottomBar) {
                            NavigationLink(destination: HomeView()) {
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
    StudentProfileView()
}
