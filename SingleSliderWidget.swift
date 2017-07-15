//
//  SingleSliderWidget.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class SingleSliderWidget: UIView {
    var slider = UISlider()
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
        label = UILabel(frame: CGRect(x: 10, y: 13, width: 70, height: 20))
        label.text = "10m"
        
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightSemibold)
        self.addSubview(label)
        
        slider = UISlider(frame: CGRect(x: label.frame.maxX + 10, y: 20, width: self.bounds.width - 90, height: 10))
        slider.tintColor = appColours.getSliderColour() //UIColor.black
        slider.thumbTintColor = appColours.getAppMainColour()
 //UIColor.black
slider.minimumTrackTintColor = appColours.getAppMainColour()
        self.addSubview(slider)
        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createSingleSliderWidget(screenWidth:CGFloat, sliderMax: Float, sliderValue: Float, text: String) -> SingleSliderWidget {
    let widget = SingleSliderWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: 75))
    
    widget.label.text = text
    widget.label.sizeToFit()
    
    
    widget.slider.frame =  CGRect(x: widget.label.frame.maxX + 10, y: 20, width: widget.bounds.width - 10 - widget.label.frame.width - 10 - 10, height: 10)
    widget.slider.maximumValue = sliderMax
    widget.slider.value = sliderValue
    
    widget.slider.center.y = widget.center.y
    widget.label.center.y = widget.center.y
    return widget
}
