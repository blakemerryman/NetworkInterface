//
//  NetworkInterface+Helpers.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

internal extension NetworkInterface {

    func buildDataTask<Body: Encodable>(method: NetworkInterfaceMethod,
                                        endpoint: String,
                                        body: Body?,
                                        completion: @escaping NetworkInterfaceCompletionHandler) -> URLSessionDataTask {

        let bodyData = try? jsonEncoder.encode(body)

        let request = URLRequest(method: method, baseURLPath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData)

        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: completion)

        return dataTask
    }

}
