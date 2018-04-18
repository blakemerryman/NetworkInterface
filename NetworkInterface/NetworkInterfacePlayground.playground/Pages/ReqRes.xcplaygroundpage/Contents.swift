//: [Previous](@previous)

import Foundation
import NetworkInterface
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -

protocol ReqResInterfaceable: NetworkInterface {}

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

        struct UserInfo: Encodable {
            let name: String
            let job: String
        }

        let userInfo = UserInfo(name: name, job: job)

        let userInfoData = try? JSONEncoder().encode(userInfo)

        post("/users", bodyData: userInfoData) { (data, response, error) in
            
            self.printData(data)
        }
    }
    
    func deleteUser(_ userId: Int) {
        
        delete("/users/\(userId)") { (data, response, error) in
            print("--------------------------------------------------")
            print("STATUS CODE --- \( (response as? HTTPURLResponse)!.statusCode )")
        }
        
    }
    
    
    // MARK: - ------------------------------------------------------------
    
    func printData(_ data: Data?) {
        
        guard let userInfo = self.decodeJSONObject(fromData: data) else {
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
