//
//  JobRequestProtocol.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import Foundation

public protocol JobRequestProtocol {
    /** Get request to retrieve active jobs
     - Parameters
         - limit: amount of jobs to return
         - filters: additional filters to query on the job request
     - Returns: A  array of Jobs
     */
    func getJobs( limit: Int, filters: [String]?, resultHandler: @escaping ([JobData]) -> Void)
}
