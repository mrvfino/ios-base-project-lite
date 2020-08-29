//  ___FILEHEADER___

import Foundation
import Moya
import RxSwift

extension ObservableType where Element == Response {

    func map2<D: Decodable>(_ decodable: D.Type) -> Observable<D> {
        let decoder = ___PACKAGENAME___JSONDecoder.shared
        
        return self
                .map(decodable, using: decoder, failsOnEmptyData: false)
                .catchError { e in

                    guard let error = e as? MoyaError else {
                        throw e
                    }

                    guard case MoyaError.objectMapping(let decodingError, _) = error else {
                        throw e
                    }

                    throw decodingError
                }
    }

}
