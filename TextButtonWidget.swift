//
//  TextButtonWidget.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-04.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class TextButtonWidget : UIView {
    var label = UILabel()
    var circle = HelperCircle()
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = appColours.getHelperSuggestionColour()
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.25
            self.layer.shadowOffset = CGSize(width: 2, height: 4)
            self.layer.shadowRadius = 4
        
        circle = HelperCircle(frame: CGRect(x: 10, y: (self.bounds.height / 2) - 10, width: 20, height: 20))
        
        
        self.addSubview(circle)
        
        label = UILabel(frame: CGRect(x: 40, y: (self.bounds.height / 2) - 25 , width: self.bounds.width - 20, height: 50))
        label.text = "TEST TEST TESTas asdjkl klajsdlk kljas dlkj aldksj lkajsd lkajs dlkjas dlkjas dkljas dlkjas dkljasdk jalksjd lkajsdl"
        label.textColor = appColours.getTextColour()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(label)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func updateLabel(text: String) {
        label.text = text
    }
    
    
    func changeColourToNav() {
        circle.changeColourToNavigation()
    }
    
    
    func getHeight(suggestionText: String, width: CGFloat) -> (CGFloat) {
        var helperHeight: CGFloat = 0
        
        let font = UIFont.boldSystemFont(ofSize: 20)
        if width < 500 {
            helperHeight = suggestionText.height(withConstrainedWidth: width - 100, font: font)
        } else {
            helperHeight = suggestionText.height(withConstrainedWidth: 500 - 100, font: font)
        }

        if helperHeight < 30 {
            helperHeight = 30
        }
        helperHeight += 10
        
        
    
        return (helperHeight)
    }

    
}

func createTextButtonWidget(text: String, screenWidth: CGFloat) -> TextButtonWidget {
    var widget = TextButtonWidget()
    let height = widget.getHeight(suggestionText: text, width: screenWidth)
    widget = TextButtonWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 40, height: height))
    widget.updateLabel(text: text)
    return widget
}
