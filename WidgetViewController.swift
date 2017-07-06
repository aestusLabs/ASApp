//
//  WidgetViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-04.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit
import  SafariServices

class WidgetViewController: UIViewController, SFSafariViewControllerDelegate {
    var helperBar = HelperBar()
    var widgets: [Widget] = []
    var currentWidgets: [UIView] = []
    var tappableWidgets: [TextButtonWidget] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        let mask = UIView(frame: CGRect(x: 0, y: 0, width: getScreenWidth(), height: getScreenHeight()))
        mask.backgroundColor = appColours.getMaskColour()
        mask.alpha = 0.98
        self.view.addSubview(mask)
        addHelperBar()

        addWidgets()
        arrangeWidgets()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {

    }
    
    func addWidgets() {
        var tag = 300
        for widget in widgets {
            if widget.widgetType == .textButton {
                let widgetToAddToView = createTextButtonWidget(text: widget.helperText, screenWidth: getScreenWidth())
                widgetToAddToView.center.x = self.view.center.x
                self.view.addSubview(widgetToAddToView)
                 widgetToAddToView.addGestureRecognizer(setTapRecognizer(sender: widgetToAddToView))
                widgetToAddToView.tag = tag
                tag += 1
                currentWidgets.append(widgetToAddToView)
                tappableWidgets.append(widgetToAddToView)
            }
        }
    }
    func arrangeWidgets() {
        var count = 0
        for card in currentWidgets {
            if count == 0 {
                card.center.y = helperBar.frame.minY - 10 - card.frame.height / 2
            } else {
                card.center.y = currentWidgets[count - 1].frame.minY - 10 - card.frame.height / 2
            }
            
            count += 1
        }
    }
    

    func addHelperBar() {
        helperBar = HelperBar(frame: CGRect(x: 0, y: getScreenHeight() - 40, width: getScreenWidth(), height: 40))
        helperBar.backgroundColor = appColours.getHelperBarBackgroundColour()
        helperBar.greyOutCircle()
        helperBar.hideText()
        self.view.addSubview(helperBar)
        
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(self.dismissHelper))
        self.helperBar.addGestureRecognizer(dismissTap)
    }
    
    
    func dismissHelper(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        self.view.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))

        self.dismiss(animated: false, completion: nil)
//        UIView.animate(withDuration: 0.35, animations: {
//            self.mask.alpha = 0.0
//            self.tempCircle.center = CGPoint(x: self.width - 37, y: self.height - (40 / 2) - 15)
//            self.tempCircle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            
//        }) { (true) in
//            self.helperBar.isHidden = true
//            self.dismiss(animated: false, completion: nil)
//        }
    }

    func setTapRecognizer(sender: TextButtonWidget) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedTextWidget))
        print(sender.label)
        return tap
    }
    
    func tappedTextWidget(sender: AnyObject) {
        for widget in tappableWidgets {
      
            if sender.view.tag == widget.tag {
                widgetActions.launchActionFor(widget: widget.label.text!)
            }
        }
    }
    
    func launchWebsite(urlString: String) {
        print("#(#(#(#(#")
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            vc.delegate = self
            
            present(vc, animated: true)
        }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    

}
