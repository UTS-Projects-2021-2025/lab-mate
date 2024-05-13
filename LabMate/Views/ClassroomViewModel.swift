//
//  ClassroomViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 13/5/2024.
//

import Foundation

@Observable
class ClassroomViewModel {
    let classroom: Classroom
    
    init(classroom: Classroom) {
        self.classroom = classroom
    }
}
