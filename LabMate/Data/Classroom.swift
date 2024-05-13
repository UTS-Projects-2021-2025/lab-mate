//
//  Classroom.swift
//  LabMate
//
//  Created by Euan Mendoza on 13/5/2024.
//

import Foundation

struct Classroom: Identifiable, Decodable {
    let id: UUID
    let code: String
    let name: String
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case name
        case updatedAt = "updated_at"
    }
}
