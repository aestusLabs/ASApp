//
//  HelperBar.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HelperBar: UIView {
    var label = UILabel()
    
    var circle = HelperCircle()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = appColours.getHelperBarBackgroundColour()        
        
        circle = HelperCircle(frame: CGRect(x: self.bounds.width - 37, y: (self.bounds.height / 2) - 15, width: 30, height: 30))
        
        
        
        self.addSubview(circle)
        
        label = UILabel(frame: CGRect(x:  self.bounds.width - 210 - 37, y: (self.bounds.height / 2) - 13 , width: 200, height: 26))
        label.textColor = appColours.getTextColour()
        label.text = "How can I help you?"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
        label.textAlignment = .right
        self.addSubview(label)
        
        
        
    }
    
    func greyOutCircle() {
        circle.greyOutCircle()
    }
    
    func showText() {
        label.isHidden = false
        label.alpha = 1.0
    }
    
    func fadeText(fadeTime: Double) {
        UIView.animate(withDuration: TimeInterval(fadeTime), animations: {
            self.label.alpha = 0.0
        })
    }
    func hideText() {
        
        label.isHidden = true
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
