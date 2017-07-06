//
//  HelperMiddleDivider.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HelperMiddleLabel: UIView {
    var circle = HelperCircle()
    var label = UILabel()
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        circle = HelperCircle(frame: CGRect(x: self.bounds.width - 270, y: (self.bounds.height / 2), width: 60, height: 60))

        
        self.addSubview(circle)
        
        label = UILabel(frame: CGRect(x: self.bounds.width - 210, y: (self.bounds.height / 2) - 25 , width: 200, height: 96))
        label.text = "how can I help you?"
        label.textColor = appColours.getTextColour()
        label.numberOfLines = 0
        label.alpha = 0.0
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightBold)
        label.textAlignment = .right
        self.addSubview(label)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func greyOutCircle() {
        //circle.backgroundColor = UIColor.black
        circle.greyOutCircle()
    }
    func colourCircler() {
        circle.colourCircle()
    }
    
}
