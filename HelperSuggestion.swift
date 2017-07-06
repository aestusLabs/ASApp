//
//  HelperSuggestion.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HelperSuggestion : UIView {
    var label = UILabel()
    var circle = HelperCircle()
    
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
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
    
}
