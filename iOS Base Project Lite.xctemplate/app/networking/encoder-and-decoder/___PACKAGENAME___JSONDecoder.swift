//  ___FILEHEADER___

import Foundation

class ___PACKAGENAME___JSONDecoder: JSONDecoder {
    
    static let shared = ___PACKAGENAME___JSONDecoder()
    
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
    
}
