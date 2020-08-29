//  ___FILEHEADER___

import Foundation
import UIKit

extension UIView {

	@IBInspectable
	var cornerradius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}

	@IBInspectable
	var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable
	var borderColor: UIColor? {
		get {
			let color = UIColor(cgColor: layer.borderColor!)
			return color
		}
		set {
			layer.borderColor = newValue?.cgColor
		}
	}
    
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.masksToBounds = true
    }

}
