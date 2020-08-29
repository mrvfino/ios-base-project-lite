//  ___FILEHEADER___

import Foundation

protocol DefaultsHelperType {
    var hasInitializedFreshInstall: Bool { set get }
}

class DefaultsHelper: DefaultsHelperType {
    
    static let shared = DefaultsHelper()
    
    private let internalDefaults = UserDefaults(suiteName: Config.shared.namespace).expect("Unable to create a new user defaults for namespace: \(Config.shared.namespace)")
    
    enum Keys: String {
        case hasInitializedFreshInstall
    }
    
    var hasInitializedFreshInstall: Bool {
        set {
            internalDefaults.set(newValue, forKey: Keys.hasInitializedFreshInstall.rawValue)
        }
        get {
            return internalDefaults.bool(forKey: Keys.hasInitializedFreshInstall.rawValue)
        }
    }
    
}
