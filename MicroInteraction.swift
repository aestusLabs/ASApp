//
//  MicroInteraction.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

protocol MicroInteractions {
    func microInteraction()
    func colourBurstAndFade(sender: Any) -> UIView
}
extension MicroInteractions {
    func microInteraction() {
        print("L@L@L@")
    }
    func colourBurstAndFade(sender: Any) -> UIView{
        print("###(S(S")
        
        let x = (sender as AnyObject).center.x
        let y = (sender as AnyObject).center.y
        print(x)
        print(y)
        let circle = UIView(frame: CGRect(x: x, y: y, width: 2, height: 2))
        // circle.center = CGPoint(x: 200, y: 600)
        
        // circle.center = self.view.center
        circle.layer.cornerRadius = 1
        circle.backgroundColor = appColours.getAppMainColour()
        // circle.clipsToBounds = true
        
        
        
        UIView.animate(withDuration: 0.35) {
            circle.alpha = 0.0
            circle.transform = CGAffineTransform(scaleX: 50, y: 50)
        }
        return circle
    }
    func colourBurstAndFadeForView(touchPoint: CGPoint) -> UIView{
        let x = touchPoint.x
        let y = touchPoint.y
        let circle = UIView(frame: CGRect(x: x, y: y, width: 2, height: 2))
        
        circle.layer.cornerRadius = 1
        circle.backgroundColor = appColours.getAppMainColour()
        
        UIView.animate(withDuration: 0.35) {
            circle.alpha = 0.0
            circle.transform = CGAffineTransform(scaleX: 50, y: 50)
        }
        return circle
    }
    
    
}
