//
//  TextFieldLoginController + Ext.swift
//  News_Radar
//
//  Created by Andrei Maskal on 13/11/2022.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard  let text = textField.text,
               let rangeOfTextToReplace = Range(range, in: text) else { return false }
        let res: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex...end])
        } else {
            res = text
        }
        checkValidation(password: res)
        textField.text = res
        let subsStringToReplace = text[rangeOfTextToReplace]
        let count = text.count - subsStringToReplace.count + string.count
        return count <= maxWidhtPassword
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        actionLogin()
        return true
    }
}
