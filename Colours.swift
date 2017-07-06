//
//  Colours.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

    struct Colours {
        
        private let appMainColour = UIColor.green
        
        
        let appColourLeft = UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        let appColourRight = UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        
        private let lightBackground = UIColor(red: 0.960784314, green: 0.960784314, blue: 0.960784314, alpha: 1.0)
        private let darkBackground = UIColor.black
        
        private let lightHelperBarBackground = UIColor.white
        private let darkHelperBarBackground = UIColor(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1.0)
        
        private let lightTextColour = UIColor.black
        private let darkTextColour = UIColor.white
        
        private let lightEmptyHelperCircle = UIColor(red: 0.290196078, green: 0.290196078, blue: 0.290196078, alpha: 1.0)
        private let darkEmptyHelperCircle = UIColor.white //UIColor(red: 0.901960784, green: 0.901960784, blue: 0.901960784, alpha: 1.0)
        
        private let lightHelperSuggestionColour = UIColor.white
        private let darkHelperSuggestionColour = UIColor(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1.0)
        
        private let lightSliderColour = UIColor.black
        private let darkSliderColour = UIColor.white
        
        private let appGradientLeft = UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        private let appGradientRight = UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        
        private let lightOnboardBehindTextField = UIColor.white
        private let darktOnboardBehindTextField = UIColor(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1.0)

        private let lightWhite = UIColor.white
        private let darkGrey = UIColor(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1.0)
        
        
        private let lightMask = UIColor.white
        private let darkMask = UIColor(red: 0.231372549, green: 0.231372549, blue: 0.231372549, alpha: 1.0)
        
        private let lightHelperSuggestionExpandedBackground = UIColor(red: 0.956862745, green: 0.956862745, blue: 0.956862745, alpha: 1.0)
        
        private let lightBehindHelperTextHomeBackground = UIColor(red: 0.988235294, green: 0.988235294, blue: 0.988235294, alpha: 1.0)
        func getAppMainColour() -> UIColor {
            return appMainColour
        }
        
        func getBackgroundColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightBackground
            } else {
                return darkBackground
            }
        }
        
        func getHelperBarBackgroundColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightHelperBarBackground
            } else {
                return darkHelperBarBackground
            }
        }
        
        func getTextColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightTextColour
            } else {
                return darkTextColour
            }
        }
        
        func getEmptyHelperColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightEmptyHelperCircle
            } else {
                return darkEmptyHelperCircle
            }
        }
        
        func getHelperSuggestionColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightHelperSuggestionColour
            } else {
                return darkHelperSuggestionColour
            }
        }
        func getSliderColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightSliderColour
            } else {
                return darkSliderColour
            }
        }
        
        func getGradientColours() -> (UIColor, UIColor) {
            return (appGradientLeft, appGradientRight)
        }
        
        func getOnboardBehindTextFieldColours() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightOnboardBehindTextField
            } else {
                return darktOnboardBehindTextField
            }
        }
        func getLineBackground() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightWhite
            } else {
                return darkGrey
            }
        }
        func getMaskColour() -> UIColor {
            if ASUser.colourTheme == .light {
                return lightMask
            } else {
                return darkMask
            }
        }
        
        func getHelperExpandedSuggestionBackground() -> UIColor {
            return lightHelperSuggestionExpandedBackground
        }
        
        func getBehindHelperTextHomeBackground() -> UIColor {
            return lightBehindHelperTextHomeBackground
        }
    }
    let appColours = Colours()


enum ColourTheme {
    case light, dark
}
struct User {
    var colourTheme = ColourTheme.light
}
let ASUser = User(colourTheme: .light)
