//
//  ToggleSwitchWidget.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class ToggleSwitchWidget: UIView {
    var title = UILabel()
    var toggleSwitch = UISwitch()
    var switchBackground = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        switchBackground = UIView(frame: CGRect(x: self.frame.maxX - 110, y: 0, width: 110, height: self.frame.height))
        switchBackground.backgroundColor = appColours.getContentSessionWidgetHightlightColout()
        self.addSubview(switchBackground)
        
        
        
     
        
        
        title = UILabel(frame: CGRect(x: 10, y: 0, width: self.frame.width - 130, height: self.frame.height))
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 27, weight: UIFontWeightBold)
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 0
        title.text = "Celsius"
        self.addSubview(title)
        
        
        toggleSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        toggleSwitch.onTintColor = appColours.getAppMainColour()
        toggleSwitch.center.x = switchBackground.center.x
        toggleSwitch.center.y = switchBackground.center.y
        toggleSwitch.isOn = true
        self.addSubview(toggleSwitch)
        
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createToggleSwitchWidget(screenWidth: CGFloat, title: String, toggleIsOn: Bool) -> ToggleSwitchWidget {
    let widget = ToggleSwitchWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: 95))
    widget.title.text = title
    widget.toggleSwitch.isOn = toggleIsOn
    return widget
    
}
