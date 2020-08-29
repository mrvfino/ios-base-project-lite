//  ___FILEHEADER___

import Foundation
import UIKit

extension UIViewController {

	enum AlertType {

		case error
		case message

		var title: String {
			switch self {
			case .error:
				return "Error"
			case .message:
				return "{app-name}"
			}
		}

	}

	func showAlert(type: AlertType, title: String?, message: String?, okActionHandler: (() -> Void)? = nil) {
		let alertController = UIAlertController(title: title ?? type.title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in okActionHandler?() })
		alertController.addAction(okAction)
		present(alertController, animated: true, completion: nil)
	}

}

