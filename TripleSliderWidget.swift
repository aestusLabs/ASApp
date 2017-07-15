//
//  TripleSliderWidget.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class TripleSliderWidget: UIView {
    var topSlider = UISlider()
    var topLabel = UILabel()
    var middleSlider = UISlider()
    var middleLabel = UILabel()
    var bottomSlider = UISlider()
    var bottomLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
        topLabel = UILabel(frame: CGRect(x: 10, y: 15, width: self.frame.width - 20, height: 20))
        topLabel.text = "music"
        topLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(topLabel)
        
        topSlider = UISlider(frame: CGRect(x:  10, y: topLabel.frame.maxY, width: self.frame.width - 20, height: 40))
        topSlider.tintColor = appColours.getSliderColour()
        topSlider.thumbTintColor = appColours.getAppMainColour()
        topSlider.minimumTrackTintColor = appColours.getAppMainColour()
        topSlider.maximumValue = 100.0
        self.addSubview(topSlider)
        
        middleLabel = UILabel(frame: CGRect(x: 10, y: topSlider.frame.maxY + 10, width: self.frame.width - 20, height: 20))
        middleLabel.text = "voice"
        middleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(middleLabel)
        
        middleSlider = UISlider(frame: CGRect(x:  10, y: middleLabel.frame.maxY, width: self.frame.width - 20, height: 40))
        middleSlider.tintColor = appColours.getSliderColour()
        middleSlider.thumbTintColor = appColours.getAppMainColour()
        middleSlider.minimumTrackTintColor = appColours.getAppMainColour()
        middleSlider.maximumValue = 100.0
        self.addSubview(middleSlider)
        
        
        bottomLabel = UILabel(frame: CGRect(x: 10, y: middleSlider.frame.maxY + 10, width: self.frame.width - 20, height: 20))
        bottomLabel.text = "sound fx"
        bottomLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(bottomLabel)
        
        bottomSlider = UISlider(frame: CGRect(x:  10, y: bottomLabel.frame.maxY, width: self.frame.width - 20, height: 40))
        bottomSlider.tintColor = appColours.getSliderColour()
        bottomSlider.thumbTintColor = appColours.getAppMainColour()
        bottomSlider.minimumTrackTintColor = appColours.getAppMainColour()
        bottomSlider.maximumValue = 100.0
        self.addSubview(bottomSlider)
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createTripleSliderWidget(screenWidth: CGFloat, arrayOfLabelText: [String]?, arrayOfSliderValues: [Float], arrayOfSliderMaximums: [Float]?) -> TripleSliderWidget {
    let widget = TripleSliderWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: 20 + 200))
    return widget
    
}
