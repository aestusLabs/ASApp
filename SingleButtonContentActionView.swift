//
//  SingleButtonContentActionView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-29.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class SingleButtonContentModule: UIView {
    var buttonLabel = ASButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        buttonLabel = ASButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(buttonLabel)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}
