//
//  OnboardIntroduceHelperViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-27.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class OnboardIntroduceHelperViewController: UIViewController {

    var body = UILabel()
    var cardBackground = UIView()
    var helperCircle = HelperCircle()
    
    var welcomeTitle = UILabel()
    var helperBar = HelperBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = appColours.getBackgroundColour()
        
         welcomeTitle = UILabel(frame: CGRect(x: 40 , y: 40, width: getScreenWidth() - 60, height: 100))
        welcomeTitle = titleLabel(label: welcomeTitle, text: "Welcome to \(appInfo.appName)")
        self.view.addSubview(welcomeTitle)
        
        
       
       
        
        
      
        
        
        
        cardBackground = UIView(frame: CGRect(x: 10, y: welcomeTitle.frame.maxY + 20, width: getScreenWidth() - 40, height: getScreenHeight() - welcomeTitle.frame.maxY - 40 )) // body.frame.height + helperCircle.frame.height + 80))
        cardBackground.center.x = self.view.center.x
            cardBackground.backgroundColor = UIColor.white
        cardBackground.layer.cornerRadius = 5
//        cardBackground.layer.masksToBounds = true

        cardBackground.layer.shadowColor = UIColor.black.cgColor
        cardBackground.layer.shadowOpacity = 0.25
        cardBackground.layer.shadowOffset = CGSize(width: 2, height: 4)
        cardBackground.layer.shadowRadius = 4
        cardBackground.layer.shouldRasterize = true
            self.view.addSubview(cardBackground)
        
        
        
        let bodyText = "I am Helper. I will assist you throughtout the app with just about everything. Tap me to learn more."
        let textFont = UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)
        let textHeight = bodyText.height(withConstrainedWidth:
            getScreenWidth() - 60, font: textFont)
        
        
         body = UILabel(frame: CGRect(x: CGFloat(40), y: getScreenHeight() - 40 - textHeight, width: getScreenWidth() - 60, height: textHeight))
//        let body = UILabel(frame: CGRect(x: 40, y: helperCircle.frame.maxY + 30, width: getScreenWidth() - 80, height: <#T##CGFloat#>)
        body.textAlignment = .center
        body.text = bodyText
        body.font = UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)
        body.numberOfLines = 0
        body.center.x = cardBackground.center.x
        
        
        
        self.view.addSubview(body)
        
        
        var helperCircleHeight = body.frame.minY - 30 - cardBackground.frame.minY
        if helperCircleHeight >= cardBackground.frame.width {
            helperCircleHeight = cardBackground.frame.width - 40
        }
        
        let midpoint = cardBackground.frame.minY  +  ((body.frame.minY - cardBackground.frame.minY) / 2)
         helperCircle = HelperCircle(frame: CGRect(x: 0, y: cardBackground.frame.minY + 20, width: helperCircleHeight, height: helperCircleHeight))
        helperCircle.center.x = self.view.center.x
        helperCircle.center.y = midpoint
        self.view.addSubview(helperCircle)
        
        var tapHelper = UITapGestureRecognizer(target: self, action: #selector(self.tappedHelper))
        helperCircle.addGestureRecognizer(tapHelper)

        helperBar = setUpHelperBar()
        helperBar.alpha = 0.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tappedHelper(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        



        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.cardBackground.alpha = 0.0
            self.body.alpha = 0.0
            self.welcomeTitle.alpha = 0.0
            self.helperBar.alpha = 1.0
            let origionalWidth = self.helperCircle.frame.width
            self.helperCircle.transform = CGAffineTransform(scaleX: 30/origionalWidth, y: 30/origionalWidth)
            self.helperCircle.center = CGPoint(x: self.getScreenWidth() - 30, y: self.getScreenHeight() - 20)
        }) { (true) in
            self.body.text = "I live down here tap me anytime you need want to navigate somewhere else of change something about the current screen. Tap me now."
            let bodyHeight = self.body.text?.height(withConstrainedWidth: self.body.frame.width, font: UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular))
            self.body.frame = CGRect(x: self.body.frame.minX, y: self.getScreenHeight() - 50 - bodyHeight!, width: self.body.frame.width, height: bodyHeight!)
           UIView.animate(withDuration: 0.25, animations: { 
                self.body.alpha = 1.0
           })
            
        }
    }

}

