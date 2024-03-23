//
//  Profile.swift
//  LMessenger
//
//  Created by JungWoo Choi on 24/3/2024.
//

import Foundation

struct Profile: Decodable {
  let username: String?
  let fullName: String?
  let website: String?
  
  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
  }
}

struct UpdateProfileParams: Encodable {
  let username: String
  let fullName: String
  let website: String
  
  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
  }
}
