//
//  SelectionView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-30.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class SelectionView: UIView{
    var viewTitle = UILabel()
    var viewSubtitle = UILabel()
    var gradientLine = UIView()
//    var tableView = UITableView()
    
    var myArray = ["One", "two", "three"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = appColours.getBackgroundColour()
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        tableView.dataSource = self
//        tableView.delegate = self
//        self.addSubview(tableView)
        
        let titleWidth = getWidthOf(title: "placeholder")
        viewTitle = UILabel(frame: CGRect(x: self.frame.width - 20 - titleWidth, y: 30, width: titleWidth, height: 48))
        viewTitle = titleLabel(label: viewTitle, text: "placeholder")
        self.addSubview(viewTitle)
        
        let gradientLineWidth: CGFloat = titleWidth + 20 //titleLabel.bounds.width
        gradientLine = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: 75, width: gradientLineWidth, height: 5))
        gradientLine.backgroundColor = UIColor.gray
        
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientLine.bounds
        let left = appColours.appColourLeft //UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        let right = appColours.appColourRight //UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        gradient.colors = [left.cgColor, right.cgColor]
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradientLine.layer.insertSublayer(gradient, at: 0)
        self.addSubview(gradientLine)
        
        viewSubtitle = UILabel(frame: CGRect(x: 0, y: gradientLine.frame.maxY, width: self.frame.width - 20, height: 30))
        viewSubtitle.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightRegular)
        viewSubtitle.textAlignment = .right
        self.addSubview(viewSubtitle)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    func updateLabels(title: String, subtitle: String) {
        
        
        viewTitle.text = title
        viewSubtitle.text = subtitle
        let titleWidth = getWidthOf(title: title)
        gradientLine.removeFromSuperview()
        let gradientLineWidth: CGFloat = titleWidth + 20 //titleLabel.bounds.width
        gradientLine = UIView(frame: CGRect(x: self.frame.width - gradientLineWidth, y: 75, width: gradientLineWidth, height: 5))
        gradientLine.backgroundColor = UIColor.gray
        
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientLine.bounds
        let light = UIColor(red: 1.0, green: 0.325490196, blue: 0.541176471, alpha: 1.0)
        let dark = UIColor(red: 1.0, green: 0.494117647, blue: 0.435294118, alpha: 1.0)
        gradient.colors = [light.cgColor, dark.cgColor]
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradientLine.layer.insertSublayer(gradient, at: 0)
        self.addSubview(gradientLine)
        
    }
    
//    func setUpTableView(arrayOfItems: [String]) {
//        var tableY = (self.frame.height - 60) - CGFloat(arrayOfItems.count * 50)
//        if tableY < viewSubtitle.frame.maxY + 20 {
//            tableY = viewSubtitle.frame.maxY + 20
//        }
//        tableView = UITableView(frame: CGRect(x: 20, y: tableY, width: self.frame.width - 40, height: CGFloat(arrayOfItems.count * 50)))
//        tableView.separatorStyle = .none
//        myArray = arrayOfItems
//        
//        
//        self.addSubview(tableView)
//        
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        cell.textLabel!.text = "\(myArray[indexPath.row])"
//        return cell
//    }
//    
//    func updateItems(arrayOfItems: [String]) {
//        myArray = arrayOfItems
//        tableView.reloadData()
//    }
    
}

func setUpSelectionView(title: String, subtitle: String, arrayOfItems: [String], screenHeight: CGFloat, screenWidth: CGFloat) -> SelectionView {
    let selectionView = SelectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    selectionView.updateLabels(title: title, subtitle: subtitle)
  //  selectionView.setUpTableView(arrayOfItems: arrayOfItems)

    return selectionView
}
