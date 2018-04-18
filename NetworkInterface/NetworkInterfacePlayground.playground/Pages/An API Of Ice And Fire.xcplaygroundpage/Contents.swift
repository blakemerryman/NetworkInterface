//: [Previous](@previous)

import Foundation
import NetworkInterface
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// MARK: -

protocol ASOIAFInterfaceable: NetworkInterface {}

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
    
    func printData(data: Data?) {
        
        guard let userInfo = self.decodeJSONObject(fromData: data) else {
            return
        }
        
        print("--------------------------------------------------")
        
        for info in userInfo {
            print("\(info.0) - \(info.1)")
        }
    }

}

//: [Next](@next)
