//
//  URLRequest+Helpers.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

internal extension URLRequest {

    /// Convenience initializer.
    init(method: NetworkInterfaceMethod, baseURLPath: String, endpoint: String, headers: [String: String], bodyData: Data?) {

        guard let baseURL = NSURL(string: baseURLPath) else {
            fatalError("Invalid base URL path!")
        }

        guard let requestURL = baseURL.appendingPathComponent(endpoint) else {
            fatalError("Invalid endpoint path component!")
        }

        self.init(url: requestURL)
        self.httpMethod = method.methodString
        self.httpBody = bodyData
        headers.forEach {
            self.setValue($0.value, forHTTPHeaderField: $0.key)
        }
    }

}
