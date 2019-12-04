//
//  customLoginButton.swift
//  school
//
//  Created by Ivan0v42 on 26.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class CustomLoginButton: UIButton {
//  @IBInspectable  override var isHighlighted: Bool {
//        didSet {
//            guard let color = backgroundColor else { return }
//
//            layer.removeAllAnimations()
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.allowUserInteraction], animations: {
//                self.backgroundColor = color.withAlphaComponent(self.isHighlighted ? 0.3 : 1)
//            })
//        }
//    }
    @IBInspectable var highlightedColor : UIColor = .clear {
        didSet {
            if (isHighlighted) {
                layer.backgroundColor = highlightedColor.cgColor
            }
        }
    }
    
    @IBInspectable override var isHighlighted: Bool{
        didSet {
            if (isHighlighted) {
                backgroundColor = highlightedColor
            }
            else
            {
                backgroundColor = .gray
                }
            }
        }
    }
    
    
    

