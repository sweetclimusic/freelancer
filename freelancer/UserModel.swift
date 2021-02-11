//
//  UserModel.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 09/02/2021.
//

import Foundation

// MARK: - UserData
public struct UserData: Codable {
    let profile: Profile
    let summary: Summary

    enum CodingKeys: String, CodingKey {
        case profile = "Profile"
        case summary = "Summary"
    }
}

// MARK: - Profile
public struct Profile: Codable {
    let firstName, surnameName, email: String
    let pro: Bool
    let summary: String
}

// MARK: - Summary
public struct Summary: Codable {
    let applied, reviewed, contacted: Int
}
