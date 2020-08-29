//  ___FILEHEADER___

import KeychainSwift

protocol KeychainHelperType {
    var accessToken: String? { set get }
    func clear()
}

class KeychainHelper: KeychainHelperType {
    
    static let shared = KeychainHelper()
    
    private let internalKeychain: KeychainSwift = KeychainSwift(keyPrefix: Config.shared.namespace)
    
    enum Keys: String {
        case accessToken
    }
    
    var accessToken: String? {
        set {
            guard let value = newValue else {
                internalKeychain.delete(Keys.accessToken.rawValue)
                return
            }
            internalKeychain.set(value, forKey: Keys.accessToken.rawValue)
        }
        get {
            return internalKeychain.get(Keys.accessToken.rawValue)
        }
    }
    
    func clear() {
        internalKeychain.clear()
    }
    
}
