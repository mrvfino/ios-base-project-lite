//  ___FILEHEADER___

import Foundation

extension String {

	var trimmed: String? {
		guard !trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			return nil
		}
		return self
	}

}

