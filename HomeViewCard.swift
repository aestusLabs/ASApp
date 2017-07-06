//
//  HomeViewCard.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-30.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HomeViewCard: UIView {

    
    var helperText = UILabel()
     var helperBackground = UIView()
    var button1 = ASButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = appColours.getHelperSuggestionColour()
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 4

         helperBackground = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 35))
        helperBackground.backgroundColor = appColours.getBehindHelperTextHomeBackground()
        self.addSubview(helperBackground)
        
        let helperCircle = HelperCircle(frame: CGRect(x: 15, y: 5, width: 20, height: 20))
        self.addSubview(helperCircle)
        
        helperText = UILabel(frame: CGRect(x: 50, y: 10, width: self.frame.width - 60, height: 30))
        helperText.font = UIFont.monospacedDigitSystemFont(ofSize: 18, weight: UIFontWeightMedium)
        self.addSubview(helperText)
        
        helperCircle.center.y = helperBackground.center.y
        helperText.center.y = helperBackground.center.y
        
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func changeHelperText(text: String) {
        helperText.text = text
    }
    
    func addButtons(arrayOfButtonsLabels: [String]) -> [ASButton]{
        var arrayOfButtons: [ASButton] = []

        var yValue = helperBackground.frame.maxY 
//arrayOfButtons1 = arrayOfButtons
        for button in arrayOfButtonsLabels {
            let buttonToDisplay = ASButton(frame: CGRect(x: 50, y: yValue, width: self.frame.width - 60, height: 50))
            buttonToDisplay.changeLabel(labelText: button)
            arrayOfButtons.append(buttonToDisplay)
            self.addSubview(buttonToDisplay)
            yValue += 50
        }
        print(arrayOfButtons)
return arrayOfButtons
    
    }
}
