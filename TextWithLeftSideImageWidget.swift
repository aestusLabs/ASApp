//
//  TextWithLeftSideImageWidget.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class TextWithLeftSideImageWidget: UIView {
    var image = UIImageView()
    var title = UILabel()
    var helperCircle = HelperCircle()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        
        helperCircle = HelperCircle(frame: CGRect(x: 12, y: 6, width: 30, height: 30))
        self.addSubview(helperCircle)
        
        image = UIImageView(frame: CGRect(x: 12, y: 6, width: 30, height: 30))
        image.image = appInfo.appImage
        self.addSubview(image)
        
        let titleWidth = self.frame.width - 12 - 30 - 22
        title = UILabel(frame: CGRect(x: image.frame.maxX + 10, y: 8, width: titleWidth, height: self.frame.height - 16))
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightSemibold)
//        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 0
        title.text = "Placeholder"
        self.addSubview(title)
       
        
        
      
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createTextWithLeftSideImageWidget(screenWidth: CGFloat, image: UIImage?, title: String) -> TextWithLeftSideImageWidget {
    let titleWidth = screenWidth - 20 - 12 - 30 - 22
    let titleHeight = title.height(withConstrainedWidth: titleWidth, font: UIFont.systemFont(ofSize: 16, weight: UIFontWeightSemibold)) + 20
    

    print("@@@@")
    print(titleHeight)
    let widget = TextWithLeftSideImageWidget(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: titleHeight))
    widget.title.text = title
    widget.image.center.y = widget.center.y
    widget.helperCircle.center.y = widget.center.y
    if let leftImage = image {
        widget.helperCircle.isHidden = true
        widget.image.image = leftImage
        widget.image.isHidden = false
    } else {
        widget.helperCircle.isHidden = false
        widget.image.isHidden = true
    }

    return widget
}
