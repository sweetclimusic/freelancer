//
//  Request.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 09/02/2021.
//

import Foundation

struct Request {
    var route: String
    var time: Date
    var userInfo: [String: Any]

    init(route: String, time: Date) {
        self.route = route
        self.time = time
        userInfo = [:]
    }
}
