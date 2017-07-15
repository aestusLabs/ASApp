//
//  WidgetScrollView.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class WidgetScrollView: UIScrollView {
    var arrayOfViews: [UIView] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize = CGSize(width: self.frame.width, height: 1000)
        self.showsVerticalScrollIndicator = false

        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

func createWidgetScrollView(screenWidth: CGFloat, height: CGFloat, arrayOfWidgets: [UIView]) -> WidgetScrollView {
    var scrollView = WidgetScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: height))
    
    var scrollViewHeight: CGFloat = 0
    var yValue: CGFloat = 10
    var tag = 800
    for view in arrayOfWidgets {
        scrollViewHeight += view.frame.height + 10
        view.frame = CGRect(x: 10, y: yValue, width: view.frame.width, height: view.frame.height)
        yValue += view.frame.height + 10
        
        scrollView.addSubview(view)
        view.tag = tag
        tag += 1
        scrollView.arrayOfViews.append(view)
        
    }
    scrollView.contentSize = CGSize(width: screenWidth, height: scrollViewHeight)
    return scrollView
}



//struct WidgetViewsWithDivider {
//    var dividerText: String
//    var arrayOfWidgets: [UIView]
//}
