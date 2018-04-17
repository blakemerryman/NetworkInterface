//
//  NetworkInterface.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

public typealias NetworkInterfaceCompletionHandler = (Data?, URLResponse?, Error?) -> Void

// MARK: - Protocol Definition

public protocol NetworkInterface {

    // MARK: - Base URL & Request Headers

    /// The base URL string for all URL requests.
    var baseURLPath: String { get }

    /// The headers to use for all URL requests.
    var requestHeaders: [String: String] { get }

    /// The JSON encoder used to encode the request's body parameters.
    var jsonEncoder: JSONEncoder { get }

    // MARK: - REST Methods

    func post<Body: Encodable>(_ endpoint: String, body: Body?, completion: @escaping NetworkInterfaceCompletionHandler)
    func put<Body: Encodable>(_ endpoint: String, body: Body?, completion: @escaping NetworkInterfaceCompletionHandler)
    func get<Body: Encodable>(_ endpoint: String, body: Body?, completion: @escaping NetworkInterfaceCompletionHandler)
    func head<Body: Encodable>(_ endpoint: String, body: Body?, completion: @escaping NetworkInterfaceCompletionHandler)
    func delete<Body: Encodable>(_ endpoint: String, body: Body?, completion: @escaping NetworkInterfaceCompletionHandler)

}
