//
//  HelperWidgetDivider.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HelperWidgetDivider: UIView {
    var circle = HelperCircle()
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        circle = HelperCircle(frame: CGRect(x: 10, y: 0, width: 60, height: 60))
        circle.center.y = self.center.y
        self.addSubview(circle)
        label = UILabel(frame: CGRect(x: 80, y: 0, width: self.frame.width - 90, height: 72))
        label.text = "10m"
        label.numberOfLines = 0

        
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightHeavy)
        self.addSubview(label)
        
        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createHelperWidgetDivider(screenWidth: CGFloat, text: String) -> HelperWidgetDivider{
    let textHeight = text.height(withConstrainedWidth: screenWidth - 20 - 90, font: UIFont.systemFont(ofSize: 30, weight: UIFontWeightHeavy))
    let divider = HelperWidgetDivider(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: textHeight))
    divider.label.text = text
    divider.label.frame = CGRect(x: 80, y: 5, width: divider.label.frame.width, height: textHeight )
    divider.circle.center.y = divider.label.center.y

    return divider
    
}
