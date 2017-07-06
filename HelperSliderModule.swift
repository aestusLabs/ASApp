//
//  HelperSliderModule.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class SliderView: UIView {
    var slider = UISlider()
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        slider = UISlider(frame: CGRect(x: 75, y: 20, width: self.bounds.width - 90, height: 10))
        slider.tintColor = appColours.getSliderColour() //UIColor.black
        slider.thumbTintColor = appColours.getSliderColour() //UIColor.black
        //        slider.
        // need to get the property to change a sliders track tint
        self.addSubview(slider)
        
        label = UILabel(frame: CGRect(x: 10, y: 13, width: 70, height: 20))
        label.text = "10m"
        
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightSemibold)
        self.addSubview(label)
        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

class ThreeSliderView: UIView {
    var musicSlider = UISlider()
    var voiceSlider = UISlider()
    var soundFXSlider = UISlider ()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        musicSlider = UISlider(frame: CGRect(x: 30, y: 60, width: self.bounds.width - 50, height: 10))
        musicSlider.tintColor = appColours.getSliderColour()
        musicSlider.thumbTintColor = appColours.getSliderColour()
        //        slider.
        // need to get the property to change a sliders track tint
        self.addSubview(musicSlider)
        
        let label = UILabel(frame: CGRect(x: 30, y: 20, width: musicSlider.frame.width, height: 20))
        label.text = "Adjust the music volume"
        label.textAlignment = .right
        label.textColor = appColours.getTextColour()
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(label)
        
        
        voiceSlider = UISlider(frame: CGRect(x: 30, y: 140, width: self.bounds.width - 50, height: 10))
        voiceSlider.tintColor = appColours.getSliderColour()
        voiceSlider.thumbTintColor = appColours.getSliderColour()
        //        slider.
        // need to get the property to change a sliders track tint
        self.addSubview(voiceSlider)
        
        let secondlabel = UILabel(frame: CGRect(x: 30, y: 100, width: voiceSlider.frame.width, height: 20))
        secondlabel.text = "Adjust the voice volume"
        secondlabel.textAlignment = .right
        secondlabel.textColor = appColours.getTextColour()
        secondlabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(secondlabel)
        
        soundFXSlider = UISlider(frame: CGRect(x: 30, y: 220, width: self.bounds.width - 50, height: 10))
        soundFXSlider.tintColor = appColours.getSliderColour()
        soundFXSlider.thumbTintColor = appColours.getSliderColour()
        //        slider.
        // need to get the property to change a sliders track tint
        self.addSubview(soundFXSlider)
        
        let thirdlabel = UILabel(frame: CGRect(x: 30, y: 180, width: soundFXSlider.frame.width, height: 20))
        thirdlabel.text = "Adjust the soundFX volume"
        thirdlabel.textAlignment = .right
        thirdlabel.textColor = appColours.getTextColour()
        thirdlabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
        self.addSubview(thirdlabel)
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
