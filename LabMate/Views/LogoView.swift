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
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, 20)
            Image(.labMateLogo)
                .resizable()
                .frame(maxWidth: 80, maxHeight: 80)
                .padding(.top, 10)
                .padding(.bottom, -15)
        }
    }
}

#Preview {
    LogoView()
}
