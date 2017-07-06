//
//  SettingsActions.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-04.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import StoreKit

enum SettingsItems {
    case contactMe, rateApp, subscribe, tellYourFriends
}


struct SettingsActions {
    
    func isWidgetSelection(itemTapped: String) -> (Bool){
        if itemTapped == "contact me" {
            return (true)
        }
        return false
    }
    
    func triageTap(itemTapped: String) {
        if itemTapped == "contact me" {
            let vc = SettingsViewController()
            vc.viewWidgetsFor(itemTapped: itemTapped)
        } else if itemTapped == "rate the app" {
            SKStoreReviewController.requestReview()
        } else if itemTapped == "tell your friends" {
            // share sheet with url to my site page for the app
        } else if itemTapped == "subscribe" {
            // pop up window with a subscribe view
        }
    }
    
    func getWidgets(itemTapped: SettingsItems) -> [Widget] {
        if itemTapped == .contactMe {
            let widget = Widget(helperText: "Go to developers site", widgetType: .textButton)
            let widget2 = Widget(helperText: "Tweet the developer", widgetType: .textButton)
            let widget3 = Widget(helperText: "Email the developer", widgetType: .textButton)
            return [widget, widget2, widget3]
        } else if itemTapped == .rateApp {
            
        } else if itemTapped == .subscribe {
            
        } else if itemTapped == .tellYourFriends {
            
        }
        return [Widget(helperText: "Error", widgetType: .textButton)]
    }
    
    func getSettingsItemFor(itemTapped: String) -> SettingsItems {
        if itemTapped == "contact me" {
            return .contactMe
        } else if itemTapped == "rate the app" {
                return .rateApp
            }
        return .contactMe
        }
    }


let settingsActions = SettingsActions()
