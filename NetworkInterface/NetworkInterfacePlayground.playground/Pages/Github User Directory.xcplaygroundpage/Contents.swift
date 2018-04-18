
import Foundation
import NetworkInterface
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -

protocol GithubInterfaceable: NetworkInterface { }

extension GithubInterfaceable {
    
    var baseURLPath: String {
        return "https://api.github.com"
    }
    
    var requestHeaders: [String : String] {
        return [:]
    }
    
}


struct GithubUserDirectory: GithubInterfaceable {
    
    func lookup(_ username: String) {

        get("/users/\(username)") { (data, response, error) in

            guard let userInfo = self.decodeJSONObject(fromData: data) else {
                return
            }

            print("--------------------------------------------------")

            for info in userInfo {
                print("\(info.key) - \(info.value)")
            }
        }
    }
    
}


let directory = GithubUserDirectory()

directory.lookup("blakemerryman")


//: [Next](@next)
