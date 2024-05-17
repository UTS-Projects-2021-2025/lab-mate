<<<<<<< HEAD
//
//  LogoView.swift
//  LabMate
//
//  Created by Christie on 16/5/2024.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("LabMate")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .padding(.top, 20)
            Image(.labMateLogo)
                .resizable()
                .frame(maxWidth: 70, maxHeight: 70)
                .padding(.top, 10)
                .padding(.bottom, -15)
        }
    }
}

#Preview {
    LogoView()
}
||||||| e205d7e
=======
//
//  LogoView.swift
//  LabMate
//
//  Created by Christie on 16/5/2024.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("LabMate")
                .font(.system(size: 40))
                .monospaced()
                .fontWeight(.semibold)
                .padding(.top, 20)
            Image(.labMateLogo)
                .resizable()
                .frame(maxWidth: 70, maxHeight: 70)
                .padding(.top, 10)
                .padding(.bottom, -15)
        }
    }
}

#Preview {
    LogoView()
}
>>>>>>> dev/euan
