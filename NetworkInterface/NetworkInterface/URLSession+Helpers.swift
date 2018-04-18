//
//  URLSession+Helpers.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/18/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

internal extension URLSession {

    func dataTask(method: NetworkInterfaceMethod,
                  basePath: String,
                  endpoint: String,
                  headers: [String: String],
                  bodyData: Data?,
                  completion: @escaping NetworkInterfaceCompletionHandler) -> URLSessionDataTask {

        let request = URLRequest(method: method, baseURLPath: basePath, endpoint: endpoint, headers: headers, bodyData: bodyData)

        let dataTask = self.dataTask(with: request, completionHandler: completion)

        return dataTask
    }

}
