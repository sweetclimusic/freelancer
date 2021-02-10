//
//  JobModel.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 09/02/2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jobData = try? newJSONDecoder().decode(JobData.self, from: jsonData)

import Foundation

// MARK: - JobData
public struct JobData: Codable {
    let jobs: Jobs
    let author: Author

    enum CodingKeys: String, CodingKey {
        case jobs = "Jobs"
        case author = "Author"
    }
}

// MARK: - Author
public struct Author: Codable {
    let name: String
    let spent: Int
}

// MARK: - Jobs
public struct Jobs: Codable {
    let title: String
    let views: Int
    let featured: Bool
    let createdAt: String
    let budget: Int
    let summary, author: String
}
