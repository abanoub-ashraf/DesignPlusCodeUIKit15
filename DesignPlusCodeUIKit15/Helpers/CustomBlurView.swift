//
//  CustomBlur.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 02/11/2022.
//

import UIKit

@IBDesignable
class CustomBlurView: UIVisualEffectView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = cornerRadius
            layer.cornerCurve = .continuous
            layer.masksToBounds = true
        }
    }
    
}
