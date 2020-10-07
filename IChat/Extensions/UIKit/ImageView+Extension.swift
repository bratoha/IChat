//
//  ImageView+Extension.swift
//  IChat
//
//  Created by Антон Калинин on 02.10.2020.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
    
}
