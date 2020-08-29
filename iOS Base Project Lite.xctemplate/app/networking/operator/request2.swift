//  ___FILEHEADER___

import Foundation
import Moya
import RxSwift

extension ApiProvider {

    func request2(_ service: ApiService) -> Observable<Response> {
        let decoder = ___PACKAGENAME___JSONDecoder.shared
        
        return self.rx.request(service)
            .filterSuccessfulStatusCodes()
            .catchError { e in

                guard let error = e as? MoyaError else {
                    throw e
                }

                guard case .statusCode(let errResp) = error else {
                    throw error
                }

                if errResp.statusCode == 401 && service.shouldAutoRefreshToken, let accessToken = KeychainHelper.shared.accessToken {
                    let params = RefreshTokenParams(token: accessToken.replacingOccurrences(of: "Bearer ", with: ""))
                    return self.request2(.refreshToken(params)).flatMap { _ in self.request2(service) }.asSingle()
                }

                guard let apiError = try? errResp.map(ApiError.self, using: decoder) else {
                    throw error
                }

                throw apiError

            }
            .asObservable()
    }
    
}
