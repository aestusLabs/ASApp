//
//  UIElements.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

enum buttonBackgrounds {
    case none, gradient, light
}

func getWidthOfButton(text: String) -> CGFloat {

    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
    label.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightHeavy)

    label.text = text
    label.sizeToFit()

    return label.frame.width + 20
}

class ASButton: UIView, MicroInteractions {
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     self.backgroundColor = UIColor.clear
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        label.textAlignment = .center
        label.textColor = appColours.getTextColour()
        label.text = "Placeholder"
        label.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightHeavy)
        //    let labelWidth = label.intrinsicContentSize
        
     //   label.sizeToFit()
        self.addSubview(label)
    
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.fireMicroInteraction))
//        self.addGestureRecognizer(tap)
    }

    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
  
   
    func changeLabel(labelText: String)  {
        label.text = labelText
    }
    
    
}


func button(title: String, background: buttonBackgrounds, shadow: Bool) -> UIView {
    var label = UILabel()

    label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
    label.textAlignment = .center
    label.textColor = appColours.getTextColour()
    label.text = title
    label.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightHeavy)
    //    let labelWidth = label.intrinsicContentSize
    
    label.sizeToFit()
    
    let button = UIView(frame: CGRect(x: 0, y: 0, width: label.bounds.width + 40, height: label.bounds.height))
    label.frame = button.frame
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    if background == .none {
    } else if background == .gradient {
        let gradient = CAGradientLayer()
        gradient.frame = button.bounds
        let colours = appColours.getGradientColours()
        gradient.colors = [colours.0.cgColor, colours.1.cgColor]
        
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        button.layer.insertSublayer(gradient, at: 0)
        label.textColor = UIColor.white
    }
    //    button.frame = label.frame
    button.addSubview(label)
    
    if shadow {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 4
    }
    
    return button
}

func getWidthOf(title: String) -> CGFloat {
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
    label.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightSemibold)
    
    label.text = title
    label.sizeToFit()
    
    return label.frame.width 
}

func titleLabel(label: UILabel, text: String) -> UILabel{
    label.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightSemibold)
    label.textColor = appColours.getTextColour()
    label.text = text
    label.numberOfLines = 0
    label.textAlignment = .right
    return label
}

func getBodyFont() -> UIFont{
    return UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)

}

func bodyLabel(label: UILabel, text: String) -> UILabel {
    
    label.textAlignment = .center
    label.text = text
    label.font = UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)
    label.numberOfLines = 0
    return label
}

//  a microinteraction protocol that UIView conforms to or a subclass of UIView
