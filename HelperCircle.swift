//
//  HelperCircle.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HelperCircle: UIView {
    let gradientCircle = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = appColours.getEmptyHelperColour()
        self.clipsToBounds = true
        
        gradientCircle.frame = self.bounds
        let blue = UIColor(red: 0.658823529, green: 0.929411765, blue: 0.917647059, alpha: 1.0) //  168 237 234
        let red = UIColor(red: 0.996078431, green: 0.839215686, blue: 0.890196078, alpha: 1.0) // 254 214 227
        gradientCircle.colors = [blue.cgColor, red.cgColor]
        
        gradientCircle.startPoint = CGPoint.zero
        gradientCircle.endPoint = CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(gradientCircle, at: 0)
        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    func greyOutCircle() {
        gradientCircle.isHidden = true
    }
    func colourCircle() {
        gradientCircle.isHidden = false
    }
    
    func changeColourToNavigation() {
        let navBlue = UIColor(red: 0.094117647, green: 0.411764706, blue: 0.976470588, alpha: 1.0)
        let navRed = UIColor(red: 1.0, green: 0.360784314, blue: 0.560784314, alpha: 1.0)
        gradientCircle.colors = [navBlue.cgColor, navRed.cgColor]
    }
}

