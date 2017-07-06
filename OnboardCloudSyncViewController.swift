//
//  OnboardCloudSyncViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class OnboardCloudSyncViewController: UIViewController {
    var helperBar = HelperBar()

    var buttonView = ASButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = appColours.getBackgroundColour()
        helperBar = setUpHelperBar()
        
        var title = UILabel(frame: CGRect(x: 0, y: 75, width: getScreenWidth() - 20, height: 45))
        title = titleLabel(label: title, text: "Turn on cloud sync?")
        title.numberOfLines = 0
        self.view.addSubview(title)
        
//        buttonView = button(title: "off", background: .none, shadow: false)
//        buttonView.center = CGPoint(x: getScreenWidth() - (buttonView.frame.width / 2) - 20, y: title.frame.maxY + 40)
        buttonView = ASButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        buttonView.center = CGPoint(x: getScreenWidth() - (buttonView.frame.width / 2) - 20, y: title.frame.maxY + 40)
        buttonView.changeLabel(labelText: "off")
        let syncTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedToggleCloudSync))
        buttonView.addGestureRecognizer(syncTap)
        
        self.view.addSubview(buttonView)
        
        let bodyText = "This uses Apples iCloud service so there is no signup process. For more info tap the Helper bar on the bottom"
        let bodyHeight = bodyText.height(withConstrainedWidth: getScreenWidth() - 40, font: getBodyFont())
        var body = UILabel(frame: CGRect(x: 20, y: buttonView.frame.maxY + 20, width: getScreenWidth() - 40, height: bodyHeight))
        body = bodyLabel(label: body, text: bodyText)
        body.textAlignment = .right
        self.view.addSubview(body)
        
        
        let continueWidth = getWidthOfButton(text: "continue")
        
        let continueButton =  ASButton(frame: CGRect(x: getScreenWidth() - (continueWidth ) , y: body.frame.maxY + 20, width: continueWidth, height: 50)) //button(title: "continue", background: .none, shadow: false)
//        continueButton.center = CGPoint(x: getScreenWidth() - (continueButton.frame.width / 2) - 20, y: body.frame.maxY + 40)
        continueButton.changeLabel(labelText: "continue")
        self.view.addSubview(continueButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedContinue))
        continueButton.addGestureRecognizer(tap)
        
//        let backWidth = getWidthOfButton(text: "back")
//        let backButton = ASButton(frame: CGRect(x: 10, y: continueButton.frame.minY, width: backWidth, height: 50))
//        backButton.changeLabel(labelText: "back")
//        self.view.addSubview(backButton)
//        let backTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedBack))
//        backButton.addGestureRecognizer(backTap)
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.swipeBack(_:)))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeBack(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
            print(vc)
            //                        self.navigationController?.pushViewController(vc, animated: true)
            self.present(vc, animated: false, completion: nil)
        }
    }
    func tappedBack(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: false, completion: nil)
        print("back")
    }
    
    func tappedToggleCloudSync(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        if buttonView.label.text == "off" {
        buttonView.changeLabel(labelText: "on")
        } else {
        buttonView.changeLabel(labelText: "off")
        }
    }
    
    func tappedContinue(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardWarning") as! OnboardHealthWarningViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: false, completion: nil)
    }

}
