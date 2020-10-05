//  ___FILEHEADER___

import Foundation

protocol StringValidatorRule {
    var message: String { get set }
    func validate(value: String) -> Bool
}

class StringValidator {
    
    var rules: [StringValidatorRule]
    
    init(rules: [StringValidatorRule]) {
        self.rules = rules
    }
    
    func validate(value: String, validationErrorMessage: inout String) -> Bool {
        
        for rule in rules {
            
            if !rule.validate(value: value) {
                
                validationErrorMessage = rule.message
                
                return false
            }
            
        }
        
        return true
    }
    
    
}
