//
//  DotsContentModule.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-29.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class Circle: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = UIColor.blue //appColours.getEmptyHelperColour()
        self.clipsToBounds = true
        
 
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func changeColour(colour: UIColor) {
        self.backgroundColor = colour
    }

    
}

class DotsContentModule: UIView {
    var dot1 = Circle()
    var dot2 = Circle()
    var dot3 = Circle()
    var dot4 = Circle()
    var dot5 = Circle()
    var dot6 = Circle()
    var dot7 = Circle()
    var dot8 = Circle()
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        dot1 = Circle(frame: CGRect(x: 10, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot2 = Circle(frame: CGRect(x: 46, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot3 = Circle(frame: CGRect(x: 82, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot4 = Circle(frame: CGRect(x: 118, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot5 = Circle(frame: CGRect(x: 154, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot6 = Circle(frame: CGRect(x: 190, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot7 = Circle(frame: CGRect(x: 226, y: self.frame.height / 2 - 13, width: 26, height: 26))
        dot8 = Circle(frame: CGRect(x: 262, y: self.frame.height / 2 - 13, width: 26, height: 26))
        

        
        
        dot1.backgroundColor = UIColor.red
        dot3.backgroundColor = UIColor.red
        dot2.backgroundColor = UIColor.black
        
//        self.addSubview(dot1)
//        self.addSubview(dot2)
//        self.addSubview(dot3)
//        self.addSubview(dot4)
//        self.addSubview(dot5)
//        self.addSubview(dot6)
//        self.addSubview(dot7)
//        self.addSubview(dot8)
        
        
        print("###")
        print(dot3.frame.minX)
        print(dot2.frame.maxX)
        print(dot3.frame.maxX)
        print(dot1.frame.minX)
//        self.backgroundColor = UIColor.cyan
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    func showNumberOfDots(number: Int) {
        let arrayOfDots = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8]
        var count = 1
        for dot in arrayOfDots {
            
            if count <= number {
                self.addSubview(dot)
            }
            count += 1
        }
        
    }
    
    func getWidthOfDotsFor(numberOfDots: Int) -> CGFloat{
        if numberOfDots == 2 {
            return 82
        } else if numberOfDots == 3 {
            return 118
        } else if numberOfDots == 4 {
            return 154
        } else if numberOfDots == 6 {
            return 226
        } else if numberOfDots == 8 {
            return 298
        } else {
            return 30
        }
        
    }
    
    func colourDots(inhale: Bool) {
//        1.0  0.850980392 0.901960784
//        0.988235294 0.721568627 0.788235294
//        0.992156863 0.6 0.733333333
//        1.0 0.376470588 0.584313725
//        0.925490196 0.243137255 0.474509804
//        0.847058824 0.164705882 0.396078431
//        0.784313725 0.066666667 0.309803922
//        0.666666667 0.023529412 0.239215686
        
        let colour1 = UIColor(red: 1.0, green: 0.850980392, blue: 0.901960784, alpha: 1.0)
        let colour2 = UIColor(red: 0.988235294, green: 0.721568627, blue: 0.788235294, alpha: 1.0)
        let colour3 = UIColor(red: 0.992156863, green: 0.6, blue: 0.733333333, alpha: 1.0)
        let colour4 = UIColor(red: 1.0, green: 0.376470588, blue: 0.584313725, alpha: 1.0)
        let colour5 = UIColor(red: 0.925490196, green: 0.243137255, blue: 0.474509804, alpha: 1.0)
        let colour6 = UIColor(red: 0.847058824, green: 0.164705882, blue: 0.396078431, alpha: 1.0)
        let colour7 = UIColor(red: 0.784313725, green: 0.066666667, blue: 0.309803922, alpha: 1.0)
        let colour8 = UIColor(red: 0.666666667, green: 0.023529412, blue: 0.239215686, alpha: 1.0)
        
        let inhaleArray = [colour1, colour2, colour3, colour4, colour5, colour6, colour7, colour8]
        let exhaleArray = [colour8, colour7, colour6, colour5, colour4, colour3, colour2, colour1]
        let arrayOfDots = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8]
        var count = 0
        for dot in arrayOfDots {
            if inhale {
            dot.backgroundColor = inhaleArray[count]
            } else {
                dot.backgroundColor = exhaleArray[count]
            }
            count += 1
        }
        
    }
    
    
}
