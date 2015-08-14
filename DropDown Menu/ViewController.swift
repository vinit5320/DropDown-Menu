//
//  ViewController.swift
//  DropDown Menu
//
//  Created by ViNiT. on 8/11/15.
//  Copyright (c) 2015 ViNiT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IGLDropDownMenuDelegate {

    var dropDownMenu = IGLDropDownMenu()
    
    var dataImage:NSArray = ["sun.png",
        "clouds.png",
        "snow.png",
        "rain.png",
        "windy.png"]
    var dataTitle:NSArray = ["Sun",
        "Clouds",
        "Snow",
        "Rain",
        "Windy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func setupInit() {

        var dropdownItems:NSMutableArray = NSMutableArray()
        
        for i in 0...(dataTitle.count-1) {
            
            var item = IGLDropDownItem()
            item.iconImage = UIImage(named: "\(dataImage[i])")
            item.text = "\(dataTitle[i])"
            dropdownItems.addObject(item)
        }
        
        dropDownMenu.menuText = "Choose Weather"
        dropDownMenu.dropDownItems = dropdownItems as [AnyObject]
        dropDownMenu.paddingLeft = 15
        dropDownMenu.frame = CGRectMake((self.view.frame.size.width/2) - 100, 150, 200, 45)
        dropDownMenu.delegate = self
        dropDownMenu.type = IGLDropDownMenuType.Stack
        dropDownMenu.gutterY = 5
        dropDownMenu.itemAnimationDelay = 0.1
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        dropDownMenu.reloadView()
        
        var myLabel = UILabel()
        myLabel.text = "SwiftyOS Blog"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.font = UIFont(name: "Helvetica-Neue", size: 17.0)
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.frame = CGRectMake((self.view.frame.size.width/2) - 100, 75, 200, 25)
        
        self.view.addSubview(myLabel)
        self.view.addSubview(self.dropDownMenu)

    }
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        
        var item:IGLDropDownItem = dropDownMenu.dropDownItems[index] as! IGLDropDownItem
        println("Selected weather \(item.text)")
        
        
    }

}

