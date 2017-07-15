//
//  WidgetCardView.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class Card: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = appColours.getCardBackgroundColour()
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor(red: 0.623529412, green: 0.623529412, blue: 0.623529412, alpha: 1.0).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func setUpCard(widget: UIView, screenWidth: CGFloat) -> Card {
    let card = Card(frame: CGRect(x: 10, y: 0, width: screenWidth - 20, height: widget.frame.height  ))
    widget.center.y = card.center.y
    card.addSubview(widget)
    return card
}
