import Foundation

public typealias RESTInterfaceableCompletionBlock = (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void

// MARK: - Protocol Definition

public protocol RESTInterfaceable {
    
    // MARK: - Base URL & Request Headers
    
    /// The base URL string for all URL requests.
    var baseURLPath: String { get }
    
    /// The headers to use for all URL requests.
    var requestHeaders: [String : String] { get }
    
    // MARK: - REST Methods
    
    func post(endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> Void
    func put(endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> Void
    func get(endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> Void
    func head(endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> Void
    func delete(endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> Void
}

// MARK: - Default Implementation

public extension RESTInterfaceable {
    
    // MARK: - Default Implementation for API REST Methods
    
    func post(endpoint: String, parameters: [String:String]? = nil, completion: RESTInterfaceableCompletionBlock) {
        
        let dataTask = buildDataTask("POST", endpoint: endpoint, parameters: parameters, completion: completion)
        
        dataTask.resume()
    }
    
    func put(endpoint: String, parameters: [String:String]? = nil, completion: RESTInterfaceableCompletionBlock) {
        
        let dataTask = buildDataTask("PUT", endpoint: endpoint, parameters: parameters, completion: completion)
        
        dataTask.resume()
    }
    
    func get(endpoint: String, parameters: [String:String]? = nil, completion: RESTInterfaceableCompletionBlock) {
        
        let dataTask = buildDataTask("GET", endpoint: endpoint, parameters: parameters, completion: completion)
        
        dataTask.resume()
    }
    
    func head(endpoint: String, parameters: [String:String]? = nil, completion: RESTInterfaceableCompletionBlock) {
        
        let dataTask = buildDataTask("HEAD", endpoint: endpoint, parameters: parameters, completion: completion)
        
        dataTask.resume()
    }
    
    func delete(endpoint: String, parameters: [String:String]? = nil, completion: RESTInterfaceableCompletionBlock) {
        
        let dataTask = buildDataTask("DELETE", endpoint: endpoint, parameters: parameters, completion: completion)
        
        dataTask.resume()
    }
    
}

// MARK: - Private Helpers

public extension RESTInterfaceable {
    
    // MARK: - Builder Methods
    
    func buildDataTask(method: String, endpoint: String, parameters: [String:String]?, completion: RESTInterfaceableCompletionBlock) -> NSURLSessionDataTask {
        
        let request = buildRequest(method, endpoint: endpoint, parameters: parameters)
        
        return NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: completion)
    }
    
    func buildRequest(method: String, endpoint: String, parameters: [String:AnyObject]?) -> NSMutableURLRequest {
        
        guard let baseURL = NSURL(string: self.baseURLPath) else {
            fatalError("BaseURL failed to init!")
        }
        
        let requestURL = baseURL.URLByAppendingPathComponent(endpoint)
        
        let request = NSMutableURLRequest(URL: requestURL)
        
        request.HTTPMethod = method
        
        for header in requestHeaders {
            let field = header.0
            let value = header.1
            request.setValue(value, forHTTPHeaderField: field)
        }
        
        request.HTTPBody = encodeJSON(fromDictionary: parameters)
        
        return request
    }
    
    
    // MARK: - JSON Helpers
    
    func encodeJSON(fromDictionary dictionary: [String:AnyObject]?) -> NSData? {
        
        guard let parameters = dictionary else {
            debugPrint("No JSON to encode!!!")
            return nil
        }
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted)
            return jsonData
        } catch let error as NSError {
            debugPrint("ERROR ENCODING JSON --- \(error.localizedDescription)")
            return nil
        }
    }
    
    func decodeJSON(fromData data: NSData?) -> [String:AnyObject]? {
        
        guard let data = data else {
            debugPrint("No Data to decode!!!")
            return nil
        }
        
        do {
            let decoded = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            return decoded as? [String:AnyObject]
        } catch let error as NSError {
            debugPrint("ERROR DECODING DATA --- \(error.localizedDescription)")
            return nil
        }
    }
    
}
