//
//  JobRequest.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import Foundation

class JobRequest {
    private static let baseUrl = "https://mockend.com/sweetclimusic/freelancer/jobs"
    private var decoder: JSONDecoder

    var time: Date
    var parameters: [String: Any] = [:]

    init(time: Date, decoder: JSONDecoder) {
        self.time = time
        self.decoder = decoder
        parameters = [:]
    }
}

extension JobRequest: JobRequestProtocol {
    func getJobs( limit: Int = 20, filters: [String]?, resultHandler: @escaping ([JobData]) -> Void) {
        // MARK: call to mockable api
    }

    func getFeaturedJobs( limit: Int = 10, resultHandler: @escaping ([JobData]) -> Void ) {
        getJobs(limit: limit, filters: ["featured"], resultHandler: resultHandler)
    }
}
