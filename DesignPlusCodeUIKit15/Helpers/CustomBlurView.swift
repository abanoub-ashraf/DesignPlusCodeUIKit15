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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateMaskLayer()
    }
    
    func updateMaskLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.mask = shapeLayer
    }
    
}
