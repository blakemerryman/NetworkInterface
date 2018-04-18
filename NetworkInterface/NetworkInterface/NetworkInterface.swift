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

    /// The session to use for all URL requests.
    var session: URLSession { get }

    /// The base URL string for all URL requests.
    var baseURLPath: String { get }

    /// The headers to use for all URL requests.
    var requestHeaders: [String: String] { get }

    // MARK: - REST Methods

    func post(_ endpoint: String, bodyData: Data?, completion: @escaping NetworkInterfaceCompletionHandler)
    func put(_ endpoint: String, bodyData: Data?, completion: @escaping NetworkInterfaceCompletionHandler)
    func get(_ endpoint: String, bodyData: Data?, completion: @escaping NetworkInterfaceCompletionHandler)
    func head(_ endpoint: String, bodyData: Data?, completion: @escaping NetworkInterfaceCompletionHandler)
    func delete(_ endpoint: String, bodyData: Data?, completion: @escaping NetworkInterfaceCompletionHandler)

}
