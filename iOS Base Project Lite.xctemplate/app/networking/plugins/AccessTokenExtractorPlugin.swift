//  ___FILEHEADER___

import Foundation
import Moya

class AccessTokenExtractorPlugin: PluginType {
    
    private var keychain: KeychainHelperType
    
    init(keychain: KeychainHelperType) {
        self.keychain = keychain
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        let apiService = target as! ApiService
        
        switch apiService {
        case .login,
             .refreshToken:
            
            switch result {
            case .success(let response):
                do {
                    let successfulResponse = try response.filterSuccessfulStatusCodes()
                    guard let header = successfulResponse.response?.allHeaderFields else { return }
                    guard let accessToken = header["Authorization"] as? String else { return }
                    keychain.accessToken = accessToken
                } catch {
                    print(error.localizedDescription)
                }
            case .failure: break
            }
            
        default:
            break
        }
    }
    
}
