//  ___FILEHEADER___

import Foundation

extension Optional {

	func expect(_ message: String) -> Wrapped {
		switch self {
		case .some(let value):
			return value
		case .none:
			fatalError(message)
		}
	}

}
