//
//  FourButtonContentModule.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-29.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class FourButtonContentModule: UIView {
    var headLabel = UILabel()
    var button1 = ASButton()
    var button2 = ASButton()
    var button3 = ASButton()
    var button4 = ASButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        headLabel.textAlignment = .center
        headLabel.textColor = appColours.getTextColour()
        headLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightSemibold)
        
        self.addSubview(headLabel)
       
        
        
    }
    
    func changeHeadLabelText(title: String) {
        headLabel.text = title
    }
    
    func addButtons(arrayOfButtons: [String]) {
        var count = 1
        var buttonsArray = [button1, button2, button3, button4]
        for button in arrayOfButtons {
            
            
            let buttonWidth = getWidthOfButton(text: button)
            
            var y: CGFloat = 0
            if count < 3 {
                y = headLabel.frame.maxY
            } else {
                y = headLabel.frame.maxY + 16 + 50
            }
            var xModifier: CGFloat = 0
            if count % 2 == 0 {
                xModifier = 5
            } else {
                xModifier = -5 - buttonWidth
            }
            buttonsArray[count - 1] = ASButton(frame: CGRect(x: self.center.x  + xModifier, y: y , width: buttonWidth, height: 50))
            buttonsArray[count - 1].changeLabel(labelText: button)
            count += 1
        }
        for button in buttonsArray {
            self.addSubview(button)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func setUpFourButtonModule(screenHeight: CGFloat, screenWidth: CGFloat, title: String, buttonNames: [String]) -> FourButtonContentModule{
    let module = FourButtonContentModule(frame: CGRect(x: 0, y: screenHeight - 220, width: screenWidth, height: 200))
    module.changeHeadLabelText(title: title)
    module.addButtons(arrayOfButtons: buttonNames)
   

   
    return module
}
