//
//  Profile.swift
//  LabMate
//
//  Created by Euan Mendoza on 14/5/2024.
//

import Foundation

struct PresenceState: Codable {
    let username: String
    let fullName: String
}

struct Profile: Identifiable, Decodable {
    let id: UUID
    let username: String?
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case fullName = "full_name"
    }
}

struct UpdateProfileParams: Encodable {
  let username: String
  let fullName: String

  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
  }
}

