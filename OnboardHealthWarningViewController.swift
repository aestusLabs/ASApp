//
//  OnboardHealthWarningViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-28.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class OnboardHealthWarningViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = appColours.getBackgroundColour()
        // Do any additional setup after loading the view.
        var title = UILabel(frame: CGRect(x: 0, y: 75, width: getScreenWidth() - 20, height: 45))
        title = titleLabel(label: title, text: "Health Warning")
        self.view.addSubview(title)
        
        let bodyText = "PLACEHOLDER can result in injury. Please consult your doctor before starting any new exercise routine. "
        let bodyHeight = bodyText.height(withConstrainedWidth: getScreenWidth() - 40, font: getBodyFont())
        var body = UILabel(frame: CGRect(x: 20, y: title.frame.maxY + 20, width: getScreenWidth() - 40, height: bodyHeight))
        body = bodyLabel(label: body, text: bodyText)
        body.textAlignment = .right
        self.view.addSubview(body)
        
       
        
//        let backWidth = getWidthOfButton(text: "back")
//        let backButton = ASButton(frame: CGRect(x: 10, y: body.frame.maxY + 20, width: backWidth, height: 50))
//        backButton.changeLabel(labelText: "back")
//        self.view.addSubview(backButton)
//        let backTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedBack))
//        backButton.addGestureRecognizer(backTap)
        
        let startWidth = getWidthOfButton(text: "start using the app")
        
        let startButton =  ASButton(frame: CGRect(x: getScreenWidth() - (startWidth ) , y: body.frame.maxY + 20, width: startWidth, height: 50)) //button(title: "continue", background: .none, shadow: false)
        //        continueButton.center = CGPoint(x: getScreenWidth() - (continueButton.frame.width / 2) - 20, y: body.frame.maxY + 40)
        startButton.changeLabel(labelText: "start using the app")
        self.view.addSubview(startButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedStart))
        startButton.addGestureRecognizer(tap)
        
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
            let vc = storyboard.instantiateViewController(withIdentifier: "OnboardSync") as! OnboardCloudSyncViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
            print(vc)
            //                        self.navigationController?.pushViewController(vc, animated: true)
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func tappedBack(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardSync") as! OnboardCloudSyncViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        print("back")
    }
    
    func tappedStart(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }

   

}

