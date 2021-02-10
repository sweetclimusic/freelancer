//
//  ClientRequestHandler.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import Foundation

public protocol ClientRequestProtocol {
    /** Post request to login with given creditials
         - Parameters userDate: username and password
         
         - Returns: A  UserData model
     */
    func loginRequest(userData: [String], resultHandler: @escaping(UserData)->Void)
}
