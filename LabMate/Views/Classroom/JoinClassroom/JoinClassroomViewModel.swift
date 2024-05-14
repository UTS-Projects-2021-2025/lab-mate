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
   
    var classroom: Classroom?
    var hasClassroom = false
    
    var isFocused = false
    
    init() {}

    func fetchClass() async throws -> Classroom {
        /*
         if !code.contains("^[0-9]{6}$") {
         errMsg = "Invalid input!"
         return
         }
         */
        
        isLoading = true
        defer { isLoading = false }
        
        if code.count != 6 {
            throw AppError.invalidInputError("Invalid Input for code \(code)")
        }
        
        return try await supabase
            .from("classrooms")
            .select()
            .eq("code", value: code)
            .single()
            .execute()
            .value
    }
    
    func toClass() {
        Task {
            errMsg = ""
            isLoading = true
            defer { isLoading = false }
            
            do {
                classroom = try await fetchClass()
                hasClassroom = true
            } catch AppError.invalidInputError(let msg) {
                debugPrint("Invalid Input \(msg)")
                errMsg = "Please enter a 6 digit code"
            } catch {
                debugPrint(error)
                errMsg = "An unexpected error occurred"
            }
        }
    }
}
