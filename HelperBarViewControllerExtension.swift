//
//  HelperBarViewControllerExtension.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit



extension UIViewController: MicroInteractions {

    
    func getScreenWidth() -> CGFloat {
        return self.view.bounds.width
    }
    func getScreenHeight() ->CGFloat {
        return self.view.bounds.height
    }
    
    func setUpHelperBar() -> HelperBar{
        
        let helperBar = HelperBar(frame: getHelperBarSize())
        helperBar.showText()
        self.view.addSubview(helperBar)
        
        let myTap = UITapGestureRecognizer(target: self, action: #selector(self.helperBarTapped))
        helperBar.addGestureRecognizer(myTap)
        
        
        fadeLabelTimer(helperBar: helperBar)
        
        
        return helperBar
        
        
    }
    
    func fadeLabelTimer(helperBar: HelperBar) {
        var timer = Timer()
        var count = 0.0
        
        timer = .scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            if count >= 0.8 {
                helperBar.fadeText(fadeTime: 0.5)
                timer.invalidate()
            }
            count += 0.1
        })
        
    }
    
    func showHelperSuggestionsVC(touchPoint: CGPoint) {
        var suggestions: [String] = []
        var navigations: [String] = []
        
        if let topController = UIApplication.shared.keyWindow?.visibleViewController() {
            print(topController)
        }
        if let currentVC = UIApplication.shared.keyWindow?.visibleViewController() {

//            if currentVC is ContentViewController {
//                let items = suggestionItems.getContentSuggestions()
//                 suggestions = items.0
//                 navigations = items.1
//            } else if currentVC is ViewController {
//                suggestions = ["ViewController", "ViewController"]
//                navigations = ["lkjads", "lakjsd"]
//            }
            
            let items = suggestionItems.getSuggestionsFor(currentVC: currentVC)
            suggestions = items.suggestions
            navigations = items.navigation
        }
        
        
        let popOver = self.storyboard?.instantiateViewController(withIdentifier: "HelperSuggestions") as! HelperSuggestionsViewController
        popOver.modalPresentationStyle = .overCurrentContext
        //        popOver.delegate = self
        
      
        popOver.suggestionsArray = suggestions
        popOver.navigationItemsArray = navigations
        popOver.initialTouchPoint = touchPoint
        
        
        self.present(popOver, animated: false)
        
    }

    
//    func assignSuggestion(suggestions: [String]) -> [String]{
//        var array: [String] = []
//        if suggestions != [] {
//            array = suggestions
//
//}//        } else {
////        }
//        
//        print(array)
//    return array
//    }
    
    func getArrays() -> ([String], [String]){

        let thisVCsSuggestions: [String] = [" alkjsd", "ajdlakjs"]//suggestionItems.suggestions
        var thisVCsNavigations = ["klajd", "laksjdlk"]//suggestionItems.navigations
        return (thisVCsSuggestions, thisVCsNavigations)
    }
    
    
    func helperBarTapped(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
//        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))

        showHelperSuggestionsVC(touchPoint: touchPoint)
    }
    
    func getHelperBarSize() -> CGRect {
        return CGRect(x: 0, y: getScreenHeight() - 40, width: getScreenWidth(), height: 40)
    }
    
}





extension UIWindow {
    
    
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController  = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: rootViewController)
        }
        return nil
    }
    
    class func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController {
        
//        if vc.isKindOfClass(UINavigationController.self) {
//            
//            let navigationController = vc as UINavigationController
//            return UIWindow.getVisibleViewControllerFrom( navigationController.visibleViewController)
//            
//        } else if vc.isKindOfClass(UITabBarController.self) {
//            
//            let tabBarController = vc as UITabBarController
//            return UIWindow.getVisibleViewControllerFrom(tabBarController.selectedViewController!)
//            
//        } else {
        
            if let presentedViewController = vc.presentedViewController {
                
                return UIWindow.getVisibleViewControllerFrom(vc: presentedViewController)
                
            } else {
                
                return vc
            }
//        }
}
}
