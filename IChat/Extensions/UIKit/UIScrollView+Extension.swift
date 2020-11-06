//
//  UIScrollView+Extension.swift
//  IChat
//
//  Created by Антон Калинин on 06.11.2020.
//

import UIKit

extension UIScrollView {
    
    var isAtBottom: Bool {
        return contentOffset.y >= verticalOffsetFoBottom
    }
    
    var verticalOffsetFoBottom: CGFloat {
        let scrollViewHeight = bounds.height
        let scrollContentSizeHeight = contentSize.height
        let bottomInset = contentInset.bottom
        let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
        return scrollViewBottomOffset
    }
    
}
