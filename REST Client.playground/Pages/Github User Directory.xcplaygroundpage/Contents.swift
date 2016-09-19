
import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -


protocol GithubInterfaceable: RESTInterfaceable { }

extension GithubInterfaceable {
    
    var baseURLPath: String {
        return "https://api.github.com"
    }
    
    var requestHeaders: [String : String] {
        return [:]
    }
    
}


struct GithubUserDirectory: GithubInterfaceable {
    
    func lookup(username: String) {
        
        get("/users/\(username)") { (data, response, error) in
            
            guard let userInfo = self.decodeJSON(fromData: data) else {
                return
            }
            
            print("--------------------------------------------------")
            
            for info in userInfo {
                print("\(info.0) - \(info.1)")
            }
        }
    }
    
}


let directory = GithubUserDirectory()

directory.lookup("blakemerryman")


//: [Next](@next)
