//
//  ClientRequest.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import Foundation

class ClientRequest {
    private static let baseUrl = "https://google.com"
    private static let mockJson = """
    {
            "Profile": {
                "firstName": "Ashlee",
                "surnameName": "Muscroft",
                "email": "ashleetheprogrammer@gmail.com",
                "pro": false,
                "summary": "Summary"
            },
            "Summary" : {
                "applied": 28,
                "reviewed": 73,
                "contacted": 18
                }
       }
    """
    private var decoder: JSONDecoder
    var userInfo: [String: Any] = [:]
    // basic init as we don't have routes
    init(decoder: JSONDecoder) {
        self.decoder = decoder
        userInfo = [:]
    }
}

// MARK: - Computed property to store session data to signify a logged in user.
extension ClientRequest {
    private var sessionKey: String { return "@@SESSION"}
    var session: [String: String] {
        get {
            return userInfo[sessionKey] as? [String: String] ?? [:]
        }
        set {
            userInfo[sessionKey] = newValue
        }
    }
}

extension ClientRequest: ClientRequestProtocol {

    func loginRequest(userData: [String], resultHandler: @escaping (UserData) -> Void) {
        let url = URL(string: ClientRequest.baseUrl)!
        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, _) in
            // Mock NSURLSessionTask POST Request donothing but return true creating a new UserData object
            let data = Data(ClientRequest.mockJson.utf8)
            do {
                let userResponse = try self.decoder.decode(UserData.self, from: data)
                    DispatchQueue.main.async {
                        resultHandler(userResponse)

                    }
            } catch {
                fatalError("No mockUser Data: \(error)")
            }
        }
        task.resume()
    }

}
