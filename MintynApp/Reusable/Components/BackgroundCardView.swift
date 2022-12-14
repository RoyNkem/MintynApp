//
//  BackgroundCardView.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

/// Reusable Background View For Cards
class BackgroundCardView: UIView {
    
    //MARK: - Properties
    
    var shadowView = UIView()
    
    var cardView = UIView()
    
    var gradientLayer = CAGradientLayer()
    
    //MARK: - Property Observers
    
    //Shadow Observers
    var shadowOpacity: Float = 0.0 {
        didSet {
            shadowView.layer.shadowOpacity = shadowOpacity
        }
    }
    
    var shadowRadius: CGFloat = 0.0 {
        didSet {
            shadowView.layer.shadowRadius = shadowRadius
        }
    }
    
    var shadowColor: UIColor? {
        didSet {
            shadowView.layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    var shadowOffset: CGSize = .zero {
        didSet {
            shadowView.layer.shadowOffset = shadowOffset
        }
    }
    
    //Corner Radius
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            cardView.layer.cornerRadius = cornerRadius
            shadowView.layer.cornerRadius = cornerRadius
        }
    }
    
    
    //Gradient Colors
    var gradientColors: [UIColor] = [UIColor.systemYellow] {
        didSet {
            var cgColors: [CGColor] = []
            
            //get cgcolor from the above
            for color in gradientColors {
                cgColors.append(color.cgColor)
            }
            
            //assign the transformed colors to the Card View gradientLayer
            gradientLayer.colors = cgColors
        }
    }
    
    //MARK: - Functions
    func setup() {
        self.addSubviews(shadowView, cardView)
        
        shadowView.anchor(top: self.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: self.width, height: self.height)
        shadowView.backgroundColor = UIColor.white
        
        cardView.anchor(top: self.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: self.width, height: self.height)
        cardView.backgroundColor = UIColor.white
        
        self.sendSubviewsToBack(cardView, shadowView)
        
        cardView.clipsToBounds = true
        cardView.layer.insertSublayer(gradientLayer, at: 0)
        
        self.backgroundColor = UIColor.clear
    }
    
    //MARK: - Frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    //MARK: Draw Gradient
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        gradientLayer.frame = cardView.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: self.height)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: self.height/3)
        gradientLayer.locations = [0,1]
    }
}
