//  ___FILEHEADER___

import Foundation

protocol CoordinatorType: AnyObject {

	var childCoordinators: [CoordinatorType] { get set }
	func start()

}

extension CoordinatorType {

	func add(_ childCoordinator: CoordinatorType) {
		childCoordinators.append(childCoordinator)
	}

	func remove(_ childCoordinator: CoordinatorType) {
		childCoordinators.removeAll(where: { $0 === childCoordinator })
	}

}
