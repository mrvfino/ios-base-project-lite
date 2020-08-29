//  ___FILEHEADER___

import Foundation
import Moya

enum ApiService {
    case login(LoginParams)
    case refreshToken(RefreshTokenParams)
}

extension ApiService: TargetType {

    var baseURL: URL {
        return Config.shared.baseURL
    }

    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .refreshToken:
            return "/auth/token/refresh"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login, .refreshToken:
            return .post
        }
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

    var task: Task {
        switch self {
        case .login(let params):
            return requestWithCustomEncoder(params)
        case .refreshToken(let params):
            return requestWithCustomEncoder(params)
        }
    }

    var headers: [String: String]? {
        let uuid = UIDevice.current.identifierForVendor!.uuidString
        return ["X-Device-UDID": uuid,
                "X-Device-OS": "iOS",
                "Content-Type": "application/json",
                "Accept": "application/json"]
    }

}

extension ApiService {

    func requestWithCustomEncoder(_ encodable: Encodable, encoder: JSONEncoder = ___PACKAGENAME___JSONEncoder.shared) -> Task {
        return Task.requestCustomJSONEncodable(encodable, encoder: encoder)
    }

}

extension ApiService {

    var requiresAuthentication: Bool {
        switch self {
        case .login, .refreshToken:
            return false
        default:
            return true
        }
    }

}

extension ApiService {

    var shouldAutoRefreshToken: Bool {
        switch self {
        case .login, .refreshToken:
            return false
        default:
            return true
        }
    }

}
