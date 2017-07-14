//
//  WidgetCard.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-14.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class WidgetCard: UIView {
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = appColours.getHelperSuggestionColour()
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 4
        
 
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    
}

func createWidgetCard(widget: UIView) -> WidgetCard {
    let card = WidgetCard(frame: CGRect(x: 0, y: 0, width: widget.frame.width + 20, height: widget.frame.width + 20))
    return card
}
