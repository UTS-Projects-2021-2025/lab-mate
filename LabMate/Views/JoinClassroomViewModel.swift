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
    var isLoading = false
    
    var hasClassroom = false
    var classroom: Classroom?
    
    init() {}

    func joinClass() {
        /*
        if !code.contains("^[0-9]{6}$") {
            errMsg = "Invalid input!"
            return
        }
         */
        
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                let clsroom: Classroom = try await supabase
                    .from("classrooms")
                    .select()
                    .eq("code", value: code)
                    .single()
                    .execute()
                    .value
               
                hasClassroom = true
                classroom = clsroom
                
            } catch {
                debugPrint(error)
                errMsg = "Error occurred"
            }
        }
        
        errMsg = ""
    }
}
