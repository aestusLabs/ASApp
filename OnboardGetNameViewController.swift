//
//  OnboardGetNameViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class OnboardGetNameViewController: UIViewController {

    var helperBar = HelperBar()

    var nameTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helperBar = setUpHelperBar()
        self.view.backgroundColor = appColours.getBackgroundColour()
        
        var title = UILabel(frame: CGRect(x: 0, y: 75, width: getScreenWidth(), height: 45))
         title = titleLabel(label: title, text: "What's your name?")
        self.view.addSubview(title)
        
        let behindTextFieldView = UIView(frame: CGRect(x: 0, y: 130, width: getScreenWidth(), height: 40))
        behindTextFieldView.backgroundColor = appColours.getOnboardBehindTextFieldColours()
        self.view.addSubview(behindTextFieldView)
        
        nameTextField = UITextField(frame: CGRect(x: 30, y: 130, width: getScreenWidth() - 60, height: 40))
        nameTextField.becomeFirstResponder()
        self.view.addSubview(nameTextField)
        
        
        let continueWidth = getWidthOfButton(text: "continue")
        let continueButton =  ASButton(frame: CGRect(x: getScreenWidth() - (continueWidth ) , y: nameTextField.frame.maxY + 20, width: continueWidth, height: 50))
        continueButton.changeLabel(labelText: "continue")
        self.view.addSubview(continueButton)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedContinue))
        continueButton.addGestureRecognizer(tap)
        
//        let backWidth = getWidthOfButton(text: "back")
//        let backButton = ASButton(frame: CGRect(x: 10, y: continueButton.frame.minY, width: backWidth, height: 50))
//        backButton.changeLabel(labelText: "back")
//        self.view.addSubview(backButton)
       // let backTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedBack))
       // backButton.addGestureRecognizer(backTap)
        
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
            print("Screen edge swiped!")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "OnboardIntroduction") as! OnboardIntroduceHelperViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
            print(vc)
            //                        self.navigationController?.pushViewController(vc, animated: true)
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func back(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardIntroduction") as! OnboardIntroduceHelperViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: false, completion: nil)
        print("back")
    }
    
    func tappedContinue(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardSync") as! OnboardCloudSyncViewController //storyboard?.instantiateViewController(withIdentifier: "OnboardName") as! OnboardGetNameViewController
        print(vc)
        //                        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: false, completion: nil)
       print("Continue")
    }
   

}
