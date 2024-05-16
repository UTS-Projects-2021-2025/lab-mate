//
//  Activity.swift
//  LabMate
//
//  Created by Euan Mendoza on 16/5/2024.
//

import Foundation

struct Activity: Identifiable, Decodable {
    let id: UUID
    let createdAt: Date
    let name: String
    let description: String
    let startTime: Date
    let endTime: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name
        case description
        case startTime = "start_time"
        case endTime = "end_time"
    }
}
