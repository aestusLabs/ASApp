//
//  AppInfo.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-28.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

struct AppInfo {
    
    let appName = "placeholder"
    let appImage = #imageLiteral(resourceName: "Placeholder Image")
    let appImageRatio: CGFloat = 0.729261053 // smaller divided by larger
    let appContentTitle = "Placeholder"
    
    let whyNameInfo = "I only use your name to greet you. Feel free to use a moniker or nickname. Your name will be sent to your other iDevices via iCloud if you turn on syncing so I don’t need to ask you again. Your name is not available to the developer. You can change what I call you in Settings."
    let privacyPolicy = "Your private data is stored on Apples servers, it is encrypted and only devices logged into your iCloud account can access it. Not only does the developer not have access to your private data he wouldn't want it even if he could get it. He believes that data should be used to make apps better, not to be sold."
    let whatIsSynced = "Things like your name and preferances are synced between devices to improve your experience."
    
    let settingsItems = ["contact me", "rate the app", "subscribe", "tell your friends" ]
    
    var homeCardsText = ["Card one", "Card two" ]//, "third card", "foruth"]
    var homeArrayOfArrayOfButtonText = [ ["item 1", "item 2", "item 3"], ["item 1", "item 2"]  ]
}
let appInfo = AppInfo()
