//
//  SettingsViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-03.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {


    var settingsView = SettingsView()
    var helperBar = HelperBar()
    var tableView = UITableView()
    var arrayOfItems: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView = setUpSettingsView(screenHeight: getScreenHeight(), screenWidth: getScreenWidth())
        settingsView.viewTitle.text = "Settings"
        self.view.addSubview(settingsView)
        helperBar = setUpHelperBar()
        arrayOfItems = appInfo.settingsItems
        
        var tableY = (self.view.frame.height - 60) - CGFloat(arrayOfItems.count * 50)
        if tableY < settingsView.gradientLine.frame.maxY + 20 {
            tableY = settingsView.gradientLine.frame.maxY + 20
        }
        tableView = UITableView(frame: CGRect(x: 20, y: tableY, width: self.view.frame.width - 40, height: CGFloat(arrayOfItems.count * 50)))
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        self.view.addSubview(tableView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tableCellTap)) //1
        tap.numberOfTapsRequired = 1
        tableView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableCellTap(touch: UIGestureRecognizer) {
        let touchPoint = touch.location(in: tableView)
        self.tableView.addSubview(colourBurstAndFadeForView(touchPoint: touchPoint))
        
        let indexPathTapped = tableView.indexPathForRow(at: touchPoint)
        
        if let indexPathTappedRow = indexPathTapped?[1] {
            
            if touchPoint.x >= tableView.frame.width - 35 {
                let itemTapped = arrayOfItems[Int(indexPathTappedRow)]

                print(arrayOfItems[Int(indexPathTappedRow)])
                tableView.reloadData()
            } else {
                
                actOnTap(indexPathTapped: indexPathTappedRow)
            }
        }
        
        
    }
    
    func actOnTap(indexPathTapped: Int) {
        let itemTapped = arrayOfItems[indexPathTapped]
        
        
        if settingsActions.isWidgetSelection(itemTapped: itemTapped) {
            viewWidgetsFor(itemTapped: itemTapped)
        } else {
            settingsActions.triageTap(itemTapped: itemTapped)
        }
        

    
    }
    
    func viewWidgetsFor(itemTapped: String) {
        let popOver = self.storyboard?.instantiateViewController(withIdentifier: "WidgetVC") as! WidgetViewController
        popOver.modalPresentationStyle = .overCurrentContext
    
        let item = settingsActions.getSettingsItemFor(itemTapped: itemTapped)
        let widgetsToShow = settingsActions.getWidgets(itemTapped: item)
        
        popOver.widgets = widgetsToShow
    
        
        
        self.present(popOver, animated: false)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(arrayOfItems[indexPath.row])"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightBold)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textAlignment = .right

        return cell
    }
    
    
    
    

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["aestusLabs@gmail.com"])
        mailComposerVC.setSubject("Feedback about \(appInfo.appName)")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController.init(title: "Could Not Send Email", message: "Your device could not send e-mail. Please check e-mail configuration and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(okAction)
        present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
   

}
