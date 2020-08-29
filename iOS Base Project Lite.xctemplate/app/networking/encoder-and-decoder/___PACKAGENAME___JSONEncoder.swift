//  ___FILEHEADER___

import Foundation

class ___PACKAGENAME___JSONEncoder: JSONEncoder {
    
    static let shared = ___PACKAGENAME___JSONEncoder()
    
    override init() {
        super.init()
        self.keyEncodingStrategy = .convertToSnakeCase
    }
    
}
