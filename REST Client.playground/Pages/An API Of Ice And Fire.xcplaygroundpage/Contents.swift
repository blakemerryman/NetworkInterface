//: [Previous](@previous)

import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -

protocol ASOIAFInterfaceable: RESTInterfaceable {}

extension ASOIAFInterfaceable {
    
    var baseURLPath: String {
        return "http://anapioficeandfire.com/api"
    }
    
    var requestHeaders: [String : String] {
        return [:]
    }

}


struct ASOIAF: ASOIAFInterfaceable {
    
    func getInfo(forBook book: Int) {
        
    }
    
    func getInfo(forHouse house: Int) {
        
    }
    
    func getInfo(forCharacter character: Int) {
        
    }
    
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

//: [Next](@next)
