//  ___FILEHEADER___

import Foundation
import RxCocoa
import RxSwift

protocol RootViewModelInput {
//    func getElements()
}

protocol RootViewModelOutput {
    var isProcessing: BehaviorRelay<Bool> { get }
    var errorMessage: BehaviorRelay<String> { get }
}

class RootViewModel: RootViewModelInput, RootViewModelOutput {

    // MARK: - Init
    
	struct Dependency {
	}

	init(dependency: Dependency) {
		self.dependency = dependency
	}
    
    var inputs: RootViewModelInput { return self }
    var outputs: RootViewModelOutput { return self }
    
    // MARK: - Inputs
    
//    func getElements() {
//        isProcessing.accept(true)
//    }
    
    // MARK: - Output
    
    let isProcessing: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let errorMessage: BehaviorRelay<String> = BehaviorRelay(value: "")

	// MARK: - Private

	private var dependency: Dependency
	private var disposeBag = DisposeBag()

    // MARK: - Deinit
    
	deinit {
		print("--Deallocating \(self)")
	}

}

extension RootViewModel {
    
    // { helpers }

}
