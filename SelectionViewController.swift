//
//  SelectionViewController.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-06-30.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import UIKit


class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var helperBar = HelperBar()
    var selectionView = SelectionView()
    let arrayOfItems = ["one", "two", "three"]
    var collectionArray = ["one"]

    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectionView = setUpSelectionView(title: "Test 24", subtitle: "Bah balha", arrayOfItems: ["one", "two", "three"], screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
        self.view.addSubview(selectionView)
        helperBar = setUpHelperBar()

        
        var tableY = (self.view.frame.height - 60) - CGFloat(arrayOfItems.count * 50)
                if tableY < selectionView.viewSubtitle.frame.maxY + 20 {
                    tableY = selectionView.viewSubtitle.frame.maxY + 20
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
                
                if collectionArray.contains(itemTapped) {
                    print("#33")
                    if let index = collectionArray.index(of: itemTapped) {
                        collectionArray.remove(at: index)
                    }
                } else {
                collectionArray.append(itemTapped)
                }
                print(arrayOfItems[Int(indexPathTappedRow)])
                tableView.reloadData()
            } else {
            
            actOnTap(indexPathTapped: indexPathTappedRow)
            }
        }

        
    }
    
    func actOnTap(indexPathTapped: Int) {
        print(indexPathTapped)
        if arrayOfItems[indexPathTapped] == "Something" {
            // doSomething
        } else if arrayOfItems[indexPathTapped] == "Something Else" {
            // doSomethingElse
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(arrayOfItems[indexPath.row])"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFontWeightBold)
        cell.backgroundColor = UIColor.clear
        
        let collectionCircle = Circle(frame: CGRect(x: cell.frame.width - 30, y: cell.frame.height / 2 - 10, width: 20, height: 20))
        collectionCircle.layer.borderColor = UIColor.black.cgColor
        collectionCircle.layer.borderWidth = 3
        
        if collectionArray.contains(arrayOfItems[indexPath.row]) {
            collectionCircle.backgroundColor = UIColor.black
        } else {
            collectionCircle.backgroundColor = appColours.getBackgroundColour()

        }
        
        cell.addSubview(collectionCircle)
        return cell
    }


}
