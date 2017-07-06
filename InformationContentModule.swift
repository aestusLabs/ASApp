//
//  InformationContentModule.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-29.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class InformationContentModule: UIView {
    var infoLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        infoLabel.textAlignment = .center
        infoLabel.textColor = appColours.getTextColour()
        infoLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightSemibold)
        
        self.addSubview(infoLabel)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
