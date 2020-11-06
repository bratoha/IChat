//
//  UILabel+Extension.swift
//  IChat
//
//  Created by Антон Калинин on 02.10.2020.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
    
    
}
