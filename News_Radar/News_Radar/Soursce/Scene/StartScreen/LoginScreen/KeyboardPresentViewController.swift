//
//  KeyboardPresentViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 11/11/2022.
//

import UIKit

class KeyboardPresentViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    func removeKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
}

