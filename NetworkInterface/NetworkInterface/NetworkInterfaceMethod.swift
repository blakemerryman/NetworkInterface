//
//  NetworkInterfaceMethod.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

internal enum NetworkInterfaceMethod: String {
    case post
    case put
    case get
    case head
    case delete
}

internal extension NetworkInterfaceMethod {
    var methodString: String {
        return self.rawValue.uppercased()
    }
}
