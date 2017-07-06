//
//  ImageContentView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-29.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit


class ImageContentView: UIView {
    
    var viewTitle = UILabel()
    var timeLabel = UILabel()
    var helperBar = HelperBar()
    var contentImage = UIImageView()
    var  gradientLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = appColours.getBackgroundColour()
        
        let titleWidth = getWidthOf(title: "16h fast")
        viewTitle = UILabel(frame: CGRect(x: self.frame.width - 20 - titleWidth, y: 30, width: titleWidth, height: 48))
        viewTitle = titleLabel(label: viewTitle, text: "16h fast")
        self.addSubview(viewTitle)
        
        let gradientLineWidth: CGFloat = titleWidth + 20 //titleLabel.bounds.width
         gradientLine = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: 75, width: gradientLineWidth, height: 5))
        gradientLine.backgroundColor = UIColor.gray
        
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientLine.bounds
        let left = appColours.appColourLeft //UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        let right = appColours.appColourRight //UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        gradient.colors = [left.cgColor, right.cgColor]
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradientLine.layer.insertSublayer(gradient, at: 0)
        self.addSubview(gradientLine)
        
        timeLabel = UILabel(frame: CGRect(x: 0, y: gradientLine.frame.maxY, width: self.frame.width - 10, height: 60))
        timeLabel.textAlignment = .right
        timeLabel.text = "0s"
        timeLabel.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightLight)
        timeLabel.textColor = appColours.getTextColour()
        self.addSubview(timeLabel)
        
        contentImage = UIImageView(frame: CGRect(x: 20, y: timeLabel.frame.maxY , width: self.frame.width - 40, height: (self.frame.height - 40) - (timeLabel.frame.maxY + 20)))
        self.addSubview(contentImage)
        
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func changeTitleTo(text: String) {
        viewTitle.removeFromSuperview()
        let titleWidth = getWidthOf(title: text)
        viewTitle = UILabel(frame: CGRect(x: self.frame.width - 20 - titleWidth, y: 30, width: titleWidth, height: 48))
        viewTitle = titleLabel(label: viewTitle, text: text)

        self.addSubview(viewTitle)

        
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

        
        viewTitle.text = text
    }
    
    func set(image: UIImage) {
        contentImage.image = image
    }
    
    func resizeImage(height: CGFloat) {
        contentImage.removeFromSuperview()
        let width:CGFloat = height * appInfo.appImageRatio
        contentImage = UIImageView(frame: CGRect(x: 20, y: timeLabel.frame.maxY , width: width, height: height))
        set(image: appInfo.appImage)
        contentImage.center.x = self.center.x
        self.addSubview(contentImage)
    }

    func changeColourTheme() {
        self.backgroundColor = appColours.getBackgroundColour()
         viewTitle.textColor = appColours.getTextColour()
         timeLabel.textColor = appColours.getTextColour()
         helperBar.backgroundColor = appColours.getHelperBarBackgroundColour()
    }
    
}
