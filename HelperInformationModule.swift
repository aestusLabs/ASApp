//
//  HelperInformationModule.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-28.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class InformationView: UIView {
    var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
      
        
        label = UILabel(frame: CGRect(x: 20, y: 10, width: self.frame.width - 40, height: self.frame.height - 20))
        label.text = ""
        label.numberOfLines = 0
        
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
        self.addSubview(label)
        
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func updateLabel(text: String) {
        label.text = text
    }
}
