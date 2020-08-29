//  ___FILEHEADER___

import Alamofire
import Foundation
import Moya

class ApiProvider: MoyaProvider<ApiService> {

    static let `default` = ApiProvider(stubbed: false, keychain: KeychainHelper.shared)

    let keychain: KeychainHelperType

    private static func defaultPlugins(usingKeychain keychain: KeychainHelperType) -> [PluginType] {
        let networkLogger = NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        let authenticationPlugin = AuthenticationPlugin(keychain: keychain)
        let accessTokenExtractor = AccessTokenExtractorPlugin(keychain: keychain)
        return [networkLogger, authenticationPlugin, accessTokenExtractor]
    }

    init(stubbed: Bool, keychain: KeychainHelperType) {
        self.keychain = keychain
        let host = Config.shared.baseURL.absoluteString
        let evaluators = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [host: PinnedCertificatesTrustEvaluator()])
        let session = Session(serverTrustManager: evaluators)
        let plugins: [PluginType] = ApiProvider.defaultPlugins(usingKeychain: keychain)
        if stubbed {
            super.init(stubClosure: MoyaProvider.immediatelyStub, session: session, plugins: plugins, trackInflights: true)
        } else {
            super.init(session: session, plugins: plugins, trackInflights: true)
        }
    }

}
