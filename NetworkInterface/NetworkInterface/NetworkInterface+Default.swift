//
//  NetworkInterface+Default.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

public extension NetworkInterface {

    var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }

    // MARK: - Default Implementation for API REST Methods

    func post<Body: Encodable>(_ endpoint: String, body: Body? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .post, endpoint: endpoint, body: body, completion: completion)

        dataTask.resume()
    }

    func put<Body: Encodable>(_ endpoint: String, body: Body? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .put, endpoint: endpoint, body: body, completion: completion)

        dataTask.resume()
    }

    func get<Body: Encodable>(_ endpoint: String, body: Body? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .get, endpoint: endpoint, body: body, completion: completion)

        dataTask.resume()
    }

    func head<Body: Encodable>(_ endpoint: String, body: Body? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .head, endpoint: endpoint, body: body, completion: completion)

        dataTask.resume()
    }

    func delete<Body: Encodable>(_ endpoint: String, body: Body? = nil, completion: @escaping NetworkInterfaceCompletionHandler) {

        let dataTask = buildDataTask(method: .delete, endpoint: endpoint, body: body, completion: completion)

        dataTask.resume()
    }

}
