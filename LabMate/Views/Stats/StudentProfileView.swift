//
//  StudentProfileView.swift
//  LabMate
//
//  Created by Christie on 11/5/2024.
//

import SwiftUI

struct StudentProfileView: View {
    //@State private var text = ""
    
    struct Lab: Identifiable {
        let id = UUID()
        let labname: String
        let labstart: String
        let labend: String
        let lablocation: String
    }
    let labs = [
        Lab(labname: "1", labstart: "16:00", labend: "17:00", lablocation: "Sydney"),
        Lab(labname: "2", labstart: "17:30", labend: "18:00", lablocation: "Africa"),
        Lab(labname: "3", labstart: "18:30", labend: "19:00", lablocation: "Korea")
    ]
    var body: some View {
        VStack {
            AppHeading("Student Stats")
            
            Text("Personal Statistics:")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack (alignment: .leading) {
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
            Spacer()
        }
        //TextEditor(text: $text)
    }
}
#Preview {
    StudentProfileView()
}
