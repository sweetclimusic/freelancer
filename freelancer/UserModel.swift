//
//  UserModel.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 09/02/2021.
//

import Foundation

// MARK: - UserData
struct UserData: Codable {
    let profile: Profile
    let summary: Summary

    enum CodingKeys: String, CodingKey {
        case profile = "Profile"
        case summary = "Summary"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let firstName, surnameName, email: String
    let pro: Bool
    let budget: Int
    let summary: String
}

// MARK: - Summary
struct Summary: Codable {
    let applied, reviewed, contacted: Int
}
