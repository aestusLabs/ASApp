//
//  StringHeightExtension.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-19.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

extension String { // Used for calculating the height of labels (so I can get the values to resize video)
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}
