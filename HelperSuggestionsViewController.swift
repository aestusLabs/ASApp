//
//  HelperSuggestionsViewController.swift
//  HelperPopUp
//
//  Created by Ian Kohlert on 2017-06-16.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class HelperSuggestionsViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    
    var sliderView = SliderView()
    var threeSliderView = ThreeSliderView()
    var informationView = InformationView()
    
    var mask = UIView()
 
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    var helperView: UIView?
    var helperBar = HelperBar()
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    var tempCircle =  HelperCircle()
    
    
    var suggestionsArray = ["Apple", "Ham sandwhiches taste good with mustard", "Jam", "lakjsadl"]
    var navigationItemsArray = ["Tree", "Hedge", "Crocodile"]
    var arrayOfSuggestions: [HelperSuggestion] = []
    var arrayOfSuggestionHeights: [CGFloat] = []
    var arrayOfNavigation: [HelperSuggestion] = []
    var middleDivider = HelperMiddleLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        height = getScreenHeight()
        width = getScreenWidth()
        
        createHelperSuggestions(suggestions: suggestionsArray, navigationItems: navigationItemsArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mask = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        mask.backgroundColor = appColours.getMaskColour() // UIColor.white
        mask.alpha = 0.00
        
        self.view.insertSubview(mask, at: 0)
        UIView.animate(withDuration: 0.5) {
            self.mask.alpha = 0.98
        }
        
        addHelperBar()
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: initialTouchPoint))

        
        tempCircle =  HelperCircle(frame: CGRect(x: width - 37, y: height - (40 / 2) - 15, width: 30, height: 30))
        self.view.addSubview(tempCircle)
        
        addSetupUpAnimation()
        
    }
    
    func addHelperBar() {
        helperBar = HelperBar(frame: CGRect(x: 0, y: height - 40, width: width, height: 40))
        helperBar.backgroundColor = appColours.getHelperBarBackgroundColour()
        helperBar.greyOutCircle()
        helperBar.hideText()
        self.view.addSubview(helperBar)
        
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(self.dismissHelper))
        self.helperBar.addGestureRecognizer(dismissTap)
    }
    
    func addSetupUpAnimation() {
        UIView.animate(withDuration: 0.35, animations: {
            self.tempCircle.center = CGPoint(x: self.middleDivider.circle.center.x, y: self.middleDivider.frame.minY + self.middleDivider.circle.center.y)
            self.tempCircle.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (true) in
            self.middleDivider.circle.colourCircle()
            UIView.animate(withDuration: 0.2, animations: {
                self.middleDivider.label.alpha = 1.0
                
            })
        }
    }

    func dismissHelper(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        UIView.animate(withDuration: 0.35, animations: {
            self.mask.alpha = 0.0
            self.tempCircle.center = CGPoint(x: self.width - 37, y: self.height - (40 / 2) - 15)
            self.tempCircle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
        }) { (true) in
            self.helperBar.isHidden = true
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    func createHelperSuggestions(suggestions: [String], navigationItems: [String]) {

        
        var heightModifier: CGFloat = 0
        var heightModIncrement: CGFloat = 0
        var first = true
        var count = 0
        
        
        func addNavigationSuggestions(suggestionText: String) {
            var helper = HelperSuggestion()
            
            if width > 500 {
                helper = HelperSuggestion(frame: CGRect(x: width - 470, y: height - heightModifier - 60, width: 450, height: 40))
                
                
            } else {
                helper = HelperSuggestion(frame: CGRect(x: 10, y: height - heightModifier - 60, width: width - 40, height: 40))
            }
       
            helper = makeHelperBackgroundLookGood(myView: helper) //helper = makeHelperNavBackgroundLookGood(myView: helper)
            helper.updateLabel(text: suggestionText)
            helper.tag = count
            helper.changeColourToNav()
            
            self.view.addSubview(helper)
            arrayOfNavigation.append(helper)
        }
        
        func addMiddleDivider() {
            let middleLabel = HelperMiddleLabel(frame: CGRect(x: 0, y: height - heightModifier - 135, width: width - 15, height: 96))
            middleLabel.tag = count
            middleLabel.greyOutCircle()
            self.view.addSubview(middleLabel)
            middleDivider = middleLabel
        }
        
        func addHelperSuggestions(suggestionText: String, helperHeight: CGFloat) {
            var helper = HelperSuggestion()
            if width > 500 {
                helper = HelperSuggestion(frame: CGRect(x: width - 470, y: height - heightModifier - 60, width: 450, height: helperHeight))
        
        
            } else {
             helper = HelperSuggestion(frame: CGRect(x: 10, y: height - heightModifier - 60, width: width - 40, height: helperHeight))
            }
            //helper.backgroundColor =  appColours.getHelperSuggestionColour()//UIColor.white
            helper = makeHelperBackgroundLookGood(myView: helper)
            //helper.center.x = self.view.center.x
            
            helper.updateLabel(text: suggestionText)
            helper.tag = count
            self.view.addSubview(helper)
            arrayOfSuggestions.append(helper)
            arrayOfSuggestionHeights.append(helperHeight)
        }
        
        
   
        
        
        
        func getHelperHeightAndHeightModIncrement(suggestionText: String) -> (height: CGFloat, mod: CGFloat) {
            var helperHeight: CGFloat = 0
            var heightModIncrement: CGFloat = 0
            
            let font = UIFont.boldSystemFont(ofSize: 20)
            if height < 500 {
            helperHeight = suggestionText.height(withConstrainedWidth: width - 100, font: font)
            } else {
            helperHeight = suggestionText.height(withConstrainedWidth: 500 - 100, font: font)
            }
            print("Helper height = \(helperHeight)")
            if helperHeight < 30 {
                helperHeight = 30
            }
            helperHeight += 10
            heightModIncrement = helperHeight + 10
            
            
            if first{
                heightModIncrement = 30
                if helperHeight > 30 {
                    heightModIncrement = 50
                }
                //                    helperHeight = 60
                first = false
            }
            return (helperHeight, heightModIncrement)
        }
        

        
        // Above are sub functions
        
        for x in suggestions {
            //var helperHeight: CGFloat = 60
 
            let heights = getHelperHeightAndHeightModIncrement(suggestionText: x)
           let helperHeight = heights.height
            heightModIncrement = heights.mod
            heightModifier += heightModIncrement
            
            addHelperSuggestions(suggestionText: x, helperHeight: helperHeight)
            count += 1
        }
        print("Mod Increment \(heightModIncrement)")
        if heightModIncrement > 60 {
            heightModIncrement = 50
        }
        heightModifier += heightModIncrement
        addMiddleDivider()
        count += 1
        heightModifier += 100
        
        count = 0
        if navigationItems.count != 0 {
        for x in 0...navigationItems.count - 1 {
            
            addNavigationSuggestions(suggestionText: navigationItems[x])
            heightModifier += 50
            count += 1

        }
        }
//        print(arrayOfSuggestions)
        
        //        var count = 0
        for suggestion in arrayOfSuggestions {
            let myTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedSuggestion(sender:))) // UITapGestureRecognizer(target: self, action: #selector(self.tappedSuggestion))
            suggestion.addGestureRecognizer(myTap)
        }
        
        // add tap nav function
        for suggestion in arrayOfNavigation {
            let myTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedNavigation(sender:)))
            suggestion.addGestureRecognizer(myTap)
        }
        
       
        
        
    }
    
    func makeHelperBackgroundLookGood(myView: HelperSuggestion) -> HelperSuggestion{
        if width < 500 {
        myView.center.x = self.view.center.x
        }
        myView.backgroundColor = appColours.getHelperSuggestionColour()
        myView.layer.cornerRadius = 3
        
        
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOpacity = 0.25
        myView.layer.shadowOffset = CGSize(width: 2, height: 4)
        myView.layer.shadowRadius = 4
        return myView
    }
    
    var lastSuggestionTapped = -1
    var lastSuggestionExpanded = false
    
    
    func getHeightOfInformationLabel(text: String) -> CGFloat {
 
        var labelHeight:CGFloat = 0
        labelHeight = text.height(withConstrainedWidth: width - 60, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular))
        labelHeight += 40

        return labelHeight


        
    }
    
    
    enum HelperWigets {
        case none, singleSlider, tripleSlider, information
    }
    
    func getCorrectWidget(tappedViewTag: Int) -> (helperWidget: HelperWigets, contentSize:CGFloat){
        let itemTapped = suggestionsArray[tappedViewTag]
        print(itemTapped)
        
        
        if itemTapped == "Why do I need your name?" {
            return (.information, getHeightOfInformationLabel(text: appInfo.whyNameInfo))
        } else if itemTapped == "Learn my privacy policy" {
            return (.information, getHeightOfInformationLabel(text: appInfo.privacyPolicy))
        } else if itemTapped == "Learn what is synced" {
            return (.information, getHeightOfInformationLabel(text: appInfo.whatIsSynced))
        }
        
        
        
        
        if itemTapped == "Mute all sound" {
            return (.singleSlider, 50)
        } else if itemTapped == "Jam"{
            return (.tripleSlider, 280)
        } else if itemTapped == "joaijskljas lkjaskl" {
          return (.singleSlider, 50)
        } else {
            return (.none, 0)
        }
        
        
        
    }
    
    func getInformationString(suggestion: String) -> String {
        if suggestion == "Why do I need your name?" {
            return appInfo.whyNameInfo
        } else if suggestion == "Learn my privacy policy" {
            return appInfo.privacyPolicy
        } else if suggestion == "Learn what is synced" {
            return appInfo.whatIsSynced
        }
        
        return ""
    }
    
    func hideModules() {
        UIView.animate(withDuration: 0.1, animations: {
            self.sliderView.alpha = 0.0
            self.threeSliderView.alpha = 0.0
            self.informationView.alpha = 0.0
        })
    }

    func tappedSuggestion(sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            print(arrayOfSuggestions[tappedView.tag])
            
            
            
            // hide all sub views
            hideModules()
            
            // My expanded views
            var expandView = false
            var contentSize: CGFloat = 0


            let widget = getCorrectWidget(tappedViewTag: tappedView.tag)
            contentSize = widget.contentSize
            let typeOfWidget = widget.helperWidget
            if typeOfWidget != .none {
                expandView = true
                print("Expand view")
            }
            
            UIView.animate(withDuration: 0.25, animations: { // this just expands or shrinks the helperSuggestionView
                
                
                if self.lastSuggestionTapped >= 0 {
                    self.moveViews(viewToCollapse: tappedView)
                }
                
                
                var increaseSizeTo: CGFloat = tappedView.frame.height + contentSize
                var moveAmount = (increaseSizeTo - tappedView.frame.height) // how much to move everything up by
                
                if tappedView.tag == self.lastSuggestionTapped  && self.lastSuggestionExpanded {
                    print("TAPPED")
                    // I could grabe the users tap location if its y is inside the origional hieght it collapes, if not nothing happens
                    
                    self.lastSuggestionExpanded = false
                    moveAmount = self.collapseExpandedView(viewToCollapse: tappedView)
                    expandView = false
                    
                } else {
                    print("Else")
                    tappedView.frame = CGRect(x: (tappedView.frame.minX), y: (tappedView.frame.minY), width: (tappedView.bounds.width), height: increaseSizeTo)
                    self.lastSuggestionExpanded = true
                    
                    
                    
                }
                self.expandSuggestion(numberOfViewTapped: tappedView.tag, increaseSize: moveAmount)
                
                
                
            }, completion: { (true) in // this adds the widget
                if expandView {
                    print("Expanded true")
                   
                    if typeOfWidget == .singleSlider {
                        print(typeOfWidget)
                    self.addSliderViewToTappedSuggestion(theView: tappedView, origionalHeightOfTheView: self.arrayOfSuggestionHeights[tappedView.tag])
                    } else if typeOfWidget == .tripleSlider {
                        print(typeOfWidget)
                        self.addThreeSliderViewWidget(theView: tappedView, origionalHeightOfView: self.arrayOfSuggestionHeights[tappedView.tag])
                    } else if typeOfWidget == .information {
                        self.addInformationViewToTappedSuggestion(theView: tappedView, origionalHeightOfView: self.arrayOfSuggestionHeights[tappedView.tag], textHeight: contentSize, text: self.getInformationString(suggestion: self.suggestionsArray[tappedView.tag]))
                        
                    }
                }
                
            })
            
            lastSuggestionTapped = tappedView.tag
        }
        
        
    }
    
    func tappedNavigation(sender: UITapGestureRecognizer){
        // print(sender.view)
        if let tappedView = sender.view {
            print(navigationItemsArray[tappedView.tag])
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            if navigationItemsArray[tappedView.tag] == "Go to next step" {
                //self.dismiss(animated: true, completion: {
                    print("!!!")


                    let vc = storyboard.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
                    print(vc)
//                        self.navigationController?.pushViewController(vc, animated: true)
                self.present(vc, animated: true, completion: nil)
               // })
                
                
            } else if navigationItemsArray[tappedView.tag] == "Home" {
                //self.dismiss(animated: true, completion: {
                print("!!!")
                
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
                print(vc)
              
//                self.present(vc, animated: true, completion: nil)
              
            self.present(vc, animated: true, completion: nil)
                
            } else if navigationItemsArray[tappedView.tag] == "Selection" {
                //self.dismiss(animated: true, completion: {
                print("!!!")
                
                let vc = storyboard.instantiateViewController(withIdentifier: "SelectionVC") as! SelectionViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
                print(vc)
                
                //                self.present(vc, animated: true, completion: nil)
                
                self.present(vc, animated: true, completion: nil)
                
            }  else if navigationItemsArray[tappedView.tag] == "Settings" {
                //self.dismiss(animated: true, completion: {
                print("!!!")
                
                let vc = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
                print(vc)
                
                //                self.present(vc, animated: true, completion: nil)
                
                self.present(vc, animated: true, completion: nil)
                
            }
            
        }
    }
    
    
    
  
    
    func moveViews(viewToCollapse: UIView) {
        
        print("moveViewsDown")
        let expandedHeight = self.arrayOfSuggestions[self.lastSuggestionTapped].frame.height
        let origionalHeightOfExpandedSuggestion = self.arrayOfSuggestionHeights[self.lastSuggestionTapped]
        
        

        self.arrayOfSuggestions[self.lastSuggestionTapped].frame = CGRect(x: (self.arrayOfSuggestions[self.lastSuggestionTapped].frame.minX), y: (self.arrayOfSuggestions[self.lastSuggestionTapped].frame.minY), width: (viewToCollapse.bounds.width), height: self.arrayOfSuggestionHeights[self.lastSuggestionTapped])
        
        
        
        UIView.animate(withDuration: 1.0, animations: {
            print("********")
            print(expandedHeight)
            
            self.middleDivider.center = CGPoint(x: self.middleDivider.frame.midX, y: self.middleDivider.frame.midY + (expandedHeight - origionalHeightOfExpandedSuggestion) )
            self.tempCircle.center = CGPoint(x: self.tempCircle.center.x, y: self.tempCircle.frame.midY + (expandedHeight - origionalHeightOfExpandedSuggestion))
            
            for x in self.lastSuggestionTapped...self.arrayOfSuggestions.count - 1{
                
                self.arrayOfSuggestions[x].center = CGPoint(x: self.arrayOfSuggestions[x].frame.midX, y: self.arrayOfSuggestions[x].frame.midY + (expandedHeight - origionalHeightOfExpandedSuggestion) )
                
                //                        self.arrayOfSuggestions[self.lastSuggestionTapped].center = CGPoint(x: self.arrayOfSuggestions[self.lastSuggestionTapped].frame.midX, y: self.arrayOfSuggestions[self.lastSuggestionTapped].frame.midY + (expandedHeight - self.arrayOfSuggestions[self.lastSuggestionTapped].frame.height) )
            }
            
            for x in self.arrayOfNavigation {
                x.center = CGPoint(x: x.frame.midX, y: x.frame.midY + (expandedHeight - origionalHeightOfExpandedSuggestion) )
            }
        })
        
    }
    
    func collapseExpandedView(viewToCollapse: UIView) -> CGFloat{
     //   let tapTag = viewToCollapse.tag
        print("CollapseExpandedView")
        let expandedHeight = self.arrayOfSuggestions[self.lastSuggestionTapped].frame.height
        let origionalHeightOfExpandedSuggestion = self.arrayOfSuggestionHeights[self.lastSuggestionTapped]
        print("Original height \(origionalHeightOfExpandedSuggestion)")
        
        viewToCollapse.frame = CGRect(x: (viewToCollapse.frame.minX), y: (viewToCollapse.frame.minY), width: (viewToCollapse.bounds.width), height: self.arrayOfSuggestionHeights[viewToCollapse.tag])
        return  -(expandedHeight - origionalHeightOfExpandedSuggestion) // negative to move it down
        //   print("Move amount \(moveAmount)")
    }
    
  
  
    
   
    
    
  

    
    func expandSuggestion(numberOfViewTapped: Int, increaseSize: CGFloat) {
        print("expandSuggestion")
        print(increaseSize)

        if increaseSize != -0.0 { // check to see if this collapses
        for x in numberOfViewTapped...arrayOfSuggestions.count - 1{
            print(x)
            UIView.animate(withDuration: 1.0, animations: {
                self.arrayOfSuggestions[x].center = CGPoint(x: self.arrayOfSuggestions[x].frame.midX, y: self.arrayOfSuggestions[x].frame.midY - increaseSize)
                
            })
        }
        
        UIView.animate(withDuration: 1.0) {
            self.middleDivider.center = CGPoint(x: self.middleDivider.frame.midX, y: self.middleDivider.frame.midY - increaseSize)
            self.tempCircle.center = CGPoint(x: self.tempCircle.center.x, y: self.tempCircle.frame.midY - increaseSize)
            
        }

        
        for x in arrayOfNavigation {
            UIView.animate(withDuration: 1.0) {
                x.center = CGPoint(x: x.frame.midX, y: x.frame.midY - increaseSize)
                
                
            }
        }
        }
    }
    
    
    func sliderValueDidChange(sender: UISlider!) {
        print(Int(sender.value * 100) )
        let sliderValue = Int(sender.value * 100)
        let theView = arrayOfSuggestions[1]
        sliderView.label.text = "\(sliderValue)m"
    }
    
    func adjustMusicVolume(sender: UISlider) {
        print(Int(sender.value * 100) )

    }
    
    func adjustVoiceVolume(sender: UISlider) {
        print(Int(sender.value * 100) )
        
    }

    func adjustSoundFXVolume(sender: UISlider) {
        print(Int(sender.value * 100) )
        
    }
    
    func addSliderViewToTappedSuggestion(theView: UIView, origionalHeightOfTheView: CGFloat) {
        sliderView = SliderView(frame: CGRect(x: 0, y: origionalHeightOfTheView, width: (theView.bounds.width), height: 50))
        sliderView.backgroundColor =  appColours.getHelperExpandedSuggestionBackground()  //UIColor(red: 0.956862745, green: 0.956862745, blue: 0.956862745, alpha: 1.0)
        sliderView.alpha = 0.0
        sliderView.slider.addTarget(self, action: #selector(self.sliderValueDidChange(sender:)), for: .valueChanged)
        theView.addSubview(sliderView)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.sliderView.alpha = 1.0
        })
    }
    
    func addThreeSliderViewWidget(theView: UIView, origionalHeightOfView: CGFloat) {
        threeSliderView = ThreeSliderView(frame: CGRect(x: 0, y: origionalHeightOfView, width: (theView.bounds.width), height: 280))
        threeSliderView.backgroundColor =  appColours.getHelperExpandedSuggestionBackground() //UIColor(red: 0.956862745, green: 0.956862745, blue: 0.956862745, alpha: 1.0)
        threeSliderView.alpha = 0.0
        threeSliderView.musicSlider.addTarget(self, action: #selector(self.adjustMusicVolume(sender:)), for: .valueChanged)
        threeSliderView.voiceSlider.addTarget(self, action: #selector(self.adjustVoiceVolume(sender:)), for: .valueChanged)
        threeSliderView.soundFXSlider.addTarget(self, action: #selector(self.adjustSoundFXVolume(sender:)), for: .valueChanged)
        
        theView.addSubview(threeSliderView)
        
    
    
        UIView.animate(withDuration: 0.25, animations: {
            self.threeSliderView.alpha = 1.0
        })
    }
    
    func addInformationViewToTappedSuggestion(theView: UIView, origionalHeightOfView: CGFloat, textHeight: CGFloat, text: String) {
        informationView = InformationView(frame: CGRect(x: 0, y: origionalHeightOfView, width: theView.frame.width, height: textHeight))
        informationView.alpha = 0.0
        informationView.backgroundColor = appColours.getHelperSuggestionColour()
        informationView.label.textColor = appColours.getTextColour()
        informationView.label.text = text
        theView.addSubview(informationView)
        
        
        
        UIView.animate(withDuration: 0.25, animations: {
            self.informationView.alpha = 1.0
        })
    }

}

