//
//  DesignableView.swift
//  ACDCSwift
//
//  Created by Pervacio on 12/10/18.
//  Copyright © 2018 Pervacio. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

enum ViewSide {
    case Left, Right, Top, Bottom
}
@IBDesignable
class DesignableView: UIView {
 
    @IBInspectable var isLeft: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var isRight: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var isTop: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var isBottom: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    @IBInspectable var hairlineColor: UIColor = UIColor.black
    
    var viewThickness:CGFloat = 0.0
    
    @IBInspectable var lineThickness:CGFloat = 0.0 {
        didSet {
            viewThickness = lineThickness
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if(isLeft){
            
            self.addBorder(toSide: .Left, withColor: hairlineColor.cgColor, andThickness: viewThickness)
        }
        
        if(isTop){
            self.addBorder(toSide: .Top, withColor: hairlineColor.cgColor, andThickness: viewThickness)
            
        }
        
        if(isRight){
            self.addBorder(toSide: .Right, withColor: hairlineColor.cgColor, andThickness: viewThickness)
            
        }
        
        if(isBottom){
            self.addBorder(toSide: .Bottom, withColor: hairlineColor.cgColor, andThickness: viewThickness)
            
        }
        
    }
        func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
            
            let border = CALayer()
            border.backgroundColor = color
            
            switch side {
            case .Left: border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height); break
            case .Right: border.frame = CGRect(x: frame.size.width - thickness, y: 0, width: thickness, height: frame.height); break
            case .Top: border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness); break
            case .Bottom: border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.width, height: thickness); break
            }
            
            layer.addSublayer(border)
        }

}

@IBDesignable
class DesignableButton: UIButton {
    
    
}

@IBDesignable
class DesignableLabel: UILabel {
    
    
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
   
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
  
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
