//
//  TitleWithGradientBarAndTime.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-14.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class TitleWithGradientBarAndTime: UIView {
    
    var titleLabel = UILabel()
    var gradientBar = UIView()
    var timeLabel = UILabel()
    override init (frame: CGRect) {
        super.init(frame: frame)
        
//        let gradientLineWidth: CGFloat =   208
//   gradientBar = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: titleLabel.frame.maxY, width: gradientLineWidth, height: 5))
//            gradientBar.backgroundColor = UIColor.gray
//        
//        
//        let gradient = CAGradientLayer()
//        gradient.frame = gradientBar.frame
//        let left = appColours.appColourLeft //UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
//        let right = appColours.appColourRight //UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
//        gradient.colors = [left.cgColor, right.cgColor]
//        
//        gradient.startPoint = CGPoint.zero
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        gradientBar.layer.insertSublayer(gradient, at: 0)
//        addSubview(gradientBar)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}


func setUpTitleView(title: String, time: String?, screenWidth: CGFloat) -> TitleWithGradientBarAndTime {
    var viewHeight: CGFloat = 30 + 42 + 5
    if time != nil {
        viewHeight += 48
    }
    let titleView = TitleWithGradientBarAndTime(frame: CGRect(x: 0, y: 0, width: screenWidth, height: viewHeight))
    titleView.titleLabel = UILabel(frame: CGRect(x: 40, y: 30, width: screenWidth - 60, height: 42))
    titleView.titleLabel.text = title
    titleView.titleLabel.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightSemibold)
    titleView.titleLabel.textColor = appColours.getTextColour()
    titleView.titleLabel.textAlignment = .right
    titleView.titleLabel.adjustsFontSizeToFitWidth = true
    titleView.addSubview(titleView.titleLabel)
    
    var titleWidth = getWidthOf(title: title)
    if titleWidth > screenWidth - 60 {
        titleWidth = screenWidth - 60
    }
    
    gradientLine.removeFromSuperview()
    let gradientLineWidth: CGFloat = titleWidth + 20 //titleLabel.bounds.width
    gradientLine = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: 75, width: gradientLineWidth, height: 5))
    let gradient = CAGradientLayer()
    gradient.frame = gradientLine.bounds
    let light = UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
    let dark = UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
    gradient.colors = [light.cgColor, dark.cgColor]
    
    gradient.startPoint = CGPoint.zero
    gradient.endPoint = CGPoint(x: 1, y: 1)
    gradientLine.layer.insertSublayer(gradient, at: 0)
    self.addSubview(gradientLine)
    
    
    let gradientLineWidth: CGFloat = titleWidth + 20
    titleView.gradientBar = UIView(frame: CGRect(x: titleView.frame.width - gradientLineWidth, y: titleView.titleLabel.frame.maxY, width: gradientLineWidth, height: 5))
    titleView.gradientBar.backgroundColor = UIColor.gray
    
    
    let gradient = CAGradientLayer()
    gradient.frame = titleView.gradientBar.frame
    let left = appColours.appColourLeft //UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
    let right = appColours.appColourRight //UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
    gradient.colors = [left.cgColor, right.cgColor]
    
    gradient.startPoint = CGPoint.zero
    gradient.endPoint = CGPoint(x: 1, y: 1)
    titleView.gradientBar.layer.insertSublayer(gradient, at: 0)
    titleView.addSubview(titleView.gradientBar)
    
    if let timeText = time  {
        titleView.timeLabel = UILabel(frame: CGRect(x: 10, y: titleView.gradientBar.frame.maxY, width:screenWidth - 30, height: 48))
        titleView.timeLabel.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightLight)
        titleView.timeLabel.textColor = appColours.getTextColour()
        titleView.timeLabel.text = timeText
        titleView.timeLabel.textAlignment = .right
        titleView.addSubview(titleView.timeLabel)
    }
    
    return titleView
}
