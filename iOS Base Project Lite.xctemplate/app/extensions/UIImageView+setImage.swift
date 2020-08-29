//  ___FILEHEADER___

import Foundation
import Kingfisher
import UIKit

extension UIImageView {

	typealias ImageType = Resource?

    func setImage(_ image: ImageType) {
        guard let _resource = image else { return }
        var kf = self.kf
        kf.indicatorType = IndicatorType.activity
        kf.setImage(with: _resource)
    }

}
