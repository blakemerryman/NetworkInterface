//
//  NetworkInterface+Default.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

// MARK: - Default Implementation

public extension NetworkInterface {

    var session: URLSession {
        return URLSession.shared
    }

    func post(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = session.dataTask(method: .post, basePath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func put(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = session.dataTask(method: .put, basePath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func get(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = session.dataTask(method: .get, basePath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func head(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = session.dataTask(method: .head, basePath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func delete(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = session.dataTask(method: .delete, basePath: baseURLPath, endpoint: endpoint, headers: requestHeaders, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

}
