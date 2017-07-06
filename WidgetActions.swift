//
//  WidgetActions.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-04.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import MessageUI

struct WidgetActions {
    
    func launchActionFor(widget: String ) {
        if widget == "Email the developer" {
                emailDeveloper()
        } else if widget == "Tweet the developer" {
            
            tweetDeveloper()
        } else if widget == "Go to developers site" {
            developerSite()
        } 
    }
    
    private func printWidgetTitle(title: String) {
        print(title)
    }
    
    
    private func developerSite() {
        if let url = URL(string: "http://www.aestusfuturistics.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    private func tweetDeveloper() {
//        let widgetViewVC = WidgetViewController()
//widgetViewVC.launchWebsite(urlString: "https://twitter.com/aestusthoughts")
        if let url = URL(string: "https://twitter.com/aestusthoughts") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    private func emailDeveloper() {
        let settingsVC = SettingsViewController()
        let mailComposeViewController = settingsVC.configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            settingsVC.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            settingsVC.showSendMailErrorAlert()
        }
    }
    
    
}
let widgetActions = WidgetActions()
