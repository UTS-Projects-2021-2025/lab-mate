//
//  JoinClassroomViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 12/5/2024.
//

import Foundation

@Observable
class JoinClassroomViewModel {
    var code = ""
    var errMsg = ""
    
    init() {}

    func joinClass() {
        if !code.contains("^[0-9]{6}$") {
            errMsg = "Invalid input!"
            return
        }
        
        errMsg = ""
    }
}
