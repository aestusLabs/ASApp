//
//  HomeViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-30.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView = HomeView()
    var helperBar = HelperBar()
    var buttons: [ASButton] = []
    var arrayOfCards: [HomeViewCard] = []
    var arrayOfButtons: [ASButton] = []
    
    var arrayOfCardsText: [String] = []
    var arrayOfArrayOfButtonText: [[String]] = [[]]
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfCardsText = appInfo.homeCardsText
        arrayOfArrayOfButtonText = appInfo.homeArrayOfArrayOfButtonText
        homeView = setUpHomeView(screenHeight: getScreenHeight(), screenWidth: getScreenWidth())
        self.view.addSubview(homeView)
        helperBar = setUpHelperBar()
        self.view.addSubview(helperBar)
        // Do any additional setup after loading the view.

        createCards()
   
        createScrollView()
             resizeImage()

        homeView.appImage.center.y = scrollView.frame.minY - 10 - homeView.appImage.frame.height / 2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getHeightOfCards() -> CGFloat{
        var height: CGFloat = 0
        for card in arrayOfCards {
            height += card.frame.height
        }
        return height
    }
    func createScrollView() {
        var scrollHeight: CGFloat = 0
        if getHeightOfCards() < helperBar.frame.minY - 20 - homeView.dateTimeWeatherWidgetBackground.frame.maxY {
            scrollHeight = getHeightOfCards() + 30
            print("smaller")
        } else {
            scrollHeight = helperBar.frame.minY - 20 - homeView.dateTimeWeatherWidgetBackground.frame.maxY
        }
        scrollView = UIScrollView(frame: CGRect(x: 0, y: homeView.appImage.frame.maxY + 10, width: getScreenWidth(), height: scrollHeight )) //helperBar.frame.minY - 20 - homeView.appImage.frame.maxY))
        scrollView.center.y = helperBar.frame.minY - scrollHeight / 2 - 10
        scrollView.showsVerticalScrollIndicator = false
        print(getHeightOfCards())
        scrollView.contentSize = CGSize(width: getScreenWidth(), height: getHeightOfCards() + 40)
        var count = 0
        for card in arrayOfCards {

         
            if count == 0 {
                card.center.y = card.center.y + 10
            }
            if count != 0 {
                card.center.y = arrayOfCards[count - 1].frame.maxY + 10 + card.frame.height / 2
            }
            count += 1
            scrollView.addSubview(card)
            
        }
        homeView.addSubview(scrollView)
    }

    func createCards() {
        var count = 0
        for card in arrayOfCardsText {
            let height = getCardHeight(numberOfButtons: arrayOfArrayOfButtonText[count].count)
            let card = HomeViewCard(frame: CGRect(x: 0, y: 0, width: getScreenWidth() - 20, height: height))
            card.changeHelperText(text: arrayOfCardsText[count])
            card.center.x = self.view.center.x

            arrayOfCards.append(card)
            arrayOfButtons.append(contentsOf: card.addButtons(arrayOfButtonsLabels: arrayOfArrayOfButtonText[count]))  //card.addButtons(arrayOfButtonsLabels: arrayOfArrayOfButtonText[count])
            
            count += 1
        }
        var tagCount = 500
        for button in arrayOfButtons {
            button.addGestureRecognizer(setTapRecognizer(sender: button))
            button.tag = tagCount
            tagCount += 1
        }
      
    }
    
    func resizeImage() {
        
            let height = scrollView.frame.minY - 15 - homeView.dateTimeWeatherWidgetBackground.frame.maxY
            let ratio = height / homeView.appImage.frame.height
            homeView.resizeImage(width: homeView.appImage.frame.width * ratio, height: height)
        
        
    }

    
    func tappedButton(sender: AnyObject) {
        print(sender.view.tag)
        for button in arrayOfButtons {
            if button.tag == sender.view.tag {
                print(button.label.text)
            }
        }
    }
    

    
    func setTapRecognizer(sender: ASButton) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedButton))
        print(sender.label)
        return tap
    }
    
    func getCardHeight(numberOfButtons: Int) -> CGFloat {
        return CGFloat(45 + 50 * numberOfButtons)
    }


}



