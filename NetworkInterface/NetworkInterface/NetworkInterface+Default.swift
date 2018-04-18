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

    func post(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .post, endpoint: endpoint, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func put(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .put, endpoint: endpoint, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func get(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .get, endpoint: endpoint, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func head(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .head, endpoint: endpoint, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

    func delete(_ endpoint: String, bodyData: Data? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .delete, endpoint: endpoint, bodyData: bodyData, completion: completion)

        dataTask.resume()
    }

}
