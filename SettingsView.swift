//
//  SettingsView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-03.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    var viewTitle = UILabel()
    var  gradientLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = appColours.getBackgroundColour()
        
        let titleWidth = getWidthOf(title: "Settings")
        viewTitle = UILabel(frame: CGRect(x: self.frame.width - 20 - titleWidth, y: 30, width: titleWidth, height: 48))
        viewTitle = titleLabel(label: viewTitle, text: "Settings")
        self.addSubview(viewTitle)
        
        let gradientLineWidth: CGFloat = titleWidth + 20 //titleLabel.bounds.width
        gradientLine = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: 75, width: gradientLineWidth, height: 5))
        gradientLine.backgroundColor = UIColor.gray
        
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientLine.bounds
        let left = appColours.appColourLeft //UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        let right = appColours.appColourRight //UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        gradient.colors = [left.cgColor, right.cgColor]
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradientLine.layer.insertSublayer(gradient, at: 0)
        self.addSubview(gradientLine)
        
     
        
      
        

    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    
//    func changeColourTheme() {
//        self.backgroundColor = appColours.getBackgroundColour()
//        viewTitle.textColor = appColours.getTextColour()
//        timeLabel.textColor = appColours.getTextColour()
//        helperBar.backgroundColor = appColours.getHelperBarBackgroundColour()
//    }
    
}

func setUpSettingsView(screenHeight: CGFloat, screenWidth: CGFloat) -> SettingsView {
    let view = SettingsView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    
    return view
}
