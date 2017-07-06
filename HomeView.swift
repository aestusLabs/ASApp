//
//  HomeView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-30.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    var viewTitle = UILabel()
    var gradientLine = UIView()
    var dateLabel = UILabel()
    var timeLabel = UILabel()
    var weatherImage = UIImageView()
    var weatherLabel = UILabel()
    var appImage = UIImageView()
    var dateTimeWeatherWidgetBackground = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        self.backgroundColor = appColours.getBackgroundColour()
        let titleWidth = getWidthOf(title: "welcome back")
        viewTitle = UILabel(frame: CGRect(x: self.frame.width - 20 - titleWidth, y: 30, width: titleWidth, height: 48))
        viewTitle = titleLabel(label: viewTitle, text: "welcome back")
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

        dateTimeWeatherWidgetBackground = UIView(frame: CGRect(x: 0, y: gradientLine.frame.maxY + 8, width: self.frame.width, height: 40))
        dateTimeWeatherWidgetBackground.backgroundColor = appColours.getLineBackground()
        self.addSubview(dateTimeWeatherWidgetBackground)


        
        
        dateLabel = UILabel(frame: CGRect(x:self.frame.width - 220, y: 0, width: 110, height: 30))
        dateLabel.center.y = dateTimeWeatherWidgetBackground.center.y

        dateLabel.text = getCurrentDate()
        dateLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightSemibold)
        self.addSubview(dateLabel)
        
        weatherLabel = UILabel(frame: CGRect(x: self.frame.width - 80, y: 0, width: 60, height: 30))
        weatherLabel.text = getWeatherTemp()
        weatherLabel.center.y = dateTimeWeatherWidgetBackground.center.y
        weatherLabel.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightSemibold)
        self.addSubview(weatherLabel)

        
        weatherImage = UIImageView(frame: CGRect(x: weatherLabel.frame.minX - 28, y: 0, width: 28 * appInfo.appImageRatio, height: 28))
        weatherImage.image = getWeatherImage()
        weatherImage.center.y = dateTimeWeatherWidgetBackground.center.y
        self.addSubview(weatherImage)
        
        appImage = UIImageView(frame: CGRect(x: 0, y: dateTimeWeatherWidgetBackground.frame.maxY + 30, width: self.frame.width - 40, height: self.frame.width - 40))
        appImage.image = appInfo.appImage
        appImage.center.x = dateTimeWeatherWidgetBackground.center.x
        self.addSubview(appImage)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func resizeImage(width: CGFloat, height: CGFloat) {
        appImage.removeFromSuperview()
        let imageWidth = height * appInfo.appImageRatio
        appImage = UIImageView(frame: CGRect(x: 0, y: dateTimeWeatherWidgetBackground.frame.maxY + 30, width: imageWidth, height: height))
        appImage.image = appInfo.appImage
        appImage.center.x = dateTimeWeatherWidgetBackground.center.x
        if height > 15 {
        self.addSubview(appImage)
        }
    }
}

func setUpHomeView(screenHeight: CGFloat, screenWidth: CGFloat) -> HomeView{
    let homeView = HomeView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    return homeView
}
