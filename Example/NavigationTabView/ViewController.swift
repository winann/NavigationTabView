//
//  ViewController.swift
//  NavigationTabView
//
//  Created by winann on 08/29/2018.
//  Copyright (c) 2018 winann. All rights reserved.
//

import UIKit
import NavigationTabView

class ViewController: UIViewController, WillAddNavigationTab {
    
    var navigationTabView: NavigationTabView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationTabView = addNavigationTab(for: ["租房", "二手房"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

