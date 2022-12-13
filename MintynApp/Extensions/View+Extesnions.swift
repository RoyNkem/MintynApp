//
//  View+Extesnions.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

extension UIView {
    
    // MARK: - UI VIEW Frame
    //Reduce boilerplate code when accessing view size
    public var width: CGFloat {
        return frame.size.width
    }
    public var height: CGFloat {
        return frame.size.height
    }
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom: CGFloat {
        return top + height
    }
    public var left: CGFloat {
        return frame.origin.x
    }
    public var right: CGFloat {
        return left + width
    }
    
    //MARK: - AutoLayout
    public func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    //MARK: - Center View
    private func center(centerX: NSLayoutXAxisAnchor?, paddingX: CGFloat, centerY: NSLayoutYAxisAnchor?, paddingY: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false //use autolayouts
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingY).isActive = true
        }
    }
    
    public func center(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?) {
        self.center(centerX: centerX, paddingX: 0, centerY: centerY, paddingY: 0)
    }
    
    //MARK: - Round Corners
    //adds custom rounded corners to specified edges
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 13, *) {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)) {
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)) {
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)) {
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)) {
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
            
        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask

        }
    }
    
    //MARK: - Add Subviews
    //iterate array of views in variadic parameter and adding individual subviews
    public func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    //MARK: - Send Subviews To Back
    public func sendSubviewsToBack(_ views: UIView...) {
        for view in views {
            sendSubviewToBack(view)
        }
    }
    
}
