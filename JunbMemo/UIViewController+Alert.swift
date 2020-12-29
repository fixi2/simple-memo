//
//  UIViewController+Alert.swift
//  JunbMemo
//
//  Created by USER on 2020/12/30.
//  Copyright © 2020 junb. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String = "Notification", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // button
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}
