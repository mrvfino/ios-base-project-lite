//  ___FILEHEADER___

import Foundation
import UIKit

protocol CustomCell {
	static var identifier: String { get }
}

extension CustomCell where Self: UITableViewCell {

	static var identifier: String {
		return String(describing: self)
	}

}

extension CustomCell where Self: UICollectionViewCell {

	static var identifier: String {
		return String(describing: self)
	}

}

extension UICollectionView {

	func register<C: CustomCell>(_ cellType: C.Type) {
		let nib = UINib(nibName: C.identifier, bundle: nil)
		self.register(nib, forCellWithReuseIdentifier: C.identifier)
	}

	func dequeue<C: CustomCell>(_ cellType: C.Type, for indexPath: IndexPath) -> C {
		return dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath) as! C
	}

}

extension UITableView {

	func register<C: CustomCell>(_ cellType: C.Type) {
		let nib = UINib(nibName: C.identifier, bundle: nil)
		self.register(nib, forCellReuseIdentifier: C.identifier)
	}

	func dequeue<C: CustomCell>(_ cellType: C.Type, for indexPath: IndexPath) -> C {
		return dequeueReusableCell(withIdentifier: C.identifier, for: indexPath) as! C
	}

}
