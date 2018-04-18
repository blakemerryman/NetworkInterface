//
//  NetworkInterface+Helpers.swift
//  NetworkInterface
//
//  Created by Blake Merryman on 4/17/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

import Foundation

// MARK: - JSON Helpers

public extension NetworkInterface {

    public func encodeJSONData(fromDictionary dictionary: [String: AnyObject]?) -> Data? {
        guard let parameters = dictionary else {
            debugPrint("No JSON to encode!!!")
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            return jsonData
        } catch let error as NSError {
            debugPrint("ERROR ENCODING JSON --- \(error.localizedDescription)")
            return nil
        }
    }

    public func decodeJSONObject(fromData data: Data?) -> [String: AnyObject]? {
        guard let data = data else {
            debugPrint("No Data to decode!!!")
            return nil
        }
        do {
            let decoded = try JSONSerialization.jsonObject(with: data, options: [])
            return decoded as? [String:AnyObject]
        } catch let error as NSError {
            debugPrint("ERROR DECODING DATA --- \(error.localizedDescription)")
            return nil
        }
    }

}
