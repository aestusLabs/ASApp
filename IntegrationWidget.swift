//
//  IntegrationWidget.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class IntegrationWidget: UIView {
    var image = UIImageView()
    var mainText = UILabel()
    var subText = UILabel()
    var toggleSwitch = UISwitch()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear

        
        
        
        image = UIImageView(frame: CGRect(x: 10, y: 16, width: 150, height: 150))
        image.image = appInfo.appImage
        image.center.x = self.center.x
        self.addSubview(image)
        
        
        mainText = UILabel(frame: CGRect(x: 20, y: image.frame.maxY + 16, width: self.frame.width - 40, height: 70))
        mainText.textAlignment = .center
        mainText.font = UIFont.systemFont(ofSize: 21, weight: UIFontWeightBold)
        mainText.adjustsFontSizeToFitWidth = true
        mainText.numberOfLines = 0
        mainText.text = "Would you like to sync with iCloud?"
        self.addSubview(mainText)
        
        subText = UILabel(frame: CGRect(x: 20, y: mainText.frame.maxY, width: self.frame.width - 40, height: 20))
        subText.textAlignment = .center
        subText.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
        subText.adjustsFontSizeToFitWidth = true
        subText.text = "Tap to learn more about this card"
        self.addSubview(subText)
        
       toggleSwitch = UISwitch(frame: CGRect(x: 0, y: subText.frame.maxY + 16, width: 40, height: 20))
        toggleSwitch.onTintColor = appColours.getAppMainColour()
        toggleSwitch.center.x = self.center.x
        self.addSubview(toggleSwitch)
  
    
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createIntegrationWidget(screenWidth: CGFloat, image: UIImage, text: String) -> IntegrationWidget {
    let widget = IntegrationWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: 340))
    widget.image.image = image
    widget.mainText.text = text
    return widget
}
