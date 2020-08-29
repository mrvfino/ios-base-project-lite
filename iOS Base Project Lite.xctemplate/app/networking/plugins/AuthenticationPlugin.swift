//  ___FILEHEADER___

import Foundation
import Moya

class AuthenticationPlugin: PluginType {
    
    private var keychain: KeychainHelperType

    // NOTE: - Update this token everytime you change projects.
    private static let basicToken = "Basic eWFtYWhhOnBSSmQ0QUVremVndA=="
    
    init(keychain: KeychainHelperType) {
        self.keychain = keychain
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        let api = target as! ApiService
        var modifiedRequest = request
        if api.requiresAuthentication {
            let accessToken = keychain.accessToken.expect("Expected access token for path: \(target.path)")
            modifiedRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
        } else {
            modifiedRequest.addValue(AuthenticationPlugin.basicToken, forHTTPHeaderField: "Authorization")
        }
        return modifiedRequest
    }
    
}
