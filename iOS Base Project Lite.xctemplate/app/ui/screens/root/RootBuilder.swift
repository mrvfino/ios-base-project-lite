//  ___FILEHEADER___

import Foundation

class RootBuilder {
    
    static func build() -> RootViewController {
        let vc = RootViewController.createFromNib()

		let viewModel: RootViewModel = {
			let dependency = RootViewModel.Dependency()
			return RootViewModel(dependency: dependency)
		}()

		vc.viewModel = viewModel

        return vc
    }
    
}
