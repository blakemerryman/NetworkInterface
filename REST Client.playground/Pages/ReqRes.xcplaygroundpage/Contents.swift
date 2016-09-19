//: [Previous](@previous)

import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -

protocol ReqResInterfaceable: RESTInterfaceable {}

extension ReqResInterfaceable {
    
    var baseURLPath: String {
        return "http://reqres.in/api"
    }
    
    var requestHeaders: [String : String] {
        return [ "Content-Type" : "application/json" ]
    }

}


struct ReqResClient: ReqResInterfaceable {
    
    func listUsers() {
        
        get("/users") { (data, response, error) in
            
            self.printData(data)
        }
    }
    
    func listUser(userId: Int) {
        
        get("/users/\(userId)") { (data, response, error) in
            
            self.printData(data)
        }
    }
    
    func createUser(name: String, job: String) {
        
        let params = [ "name" : name, "job"  : job ]
        
        post("/users", parameters: params) { (data, response, error) in
            
            self.printData(data)
        }
    }
    
    func deleteUser(userId: Int) {
        
        delete("/users/\(userId)") { (data, response, error) in
            print("--------------------------------------------------")
            print("STATUS CODE --- \( (response as? NSHTTPURLResponse)!.statusCode )")
        }
        
    }
    
    
    // MARK: - ------------------------------------------------------------
    
    func printData(data: NSData?) {
        
        guard let userInfo = self.decodeJSON(fromData: data) else {
            return
        }
        
        print("--------------------------------------------------")
        
        for info in userInfo {
            print("\(info.0) - \(info.1)")
        }
    }
}


ReqResClient().deleteUser(2)

//: [Next](@next)
