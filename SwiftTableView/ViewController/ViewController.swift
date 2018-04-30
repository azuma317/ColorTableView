//
//  ViewController.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/04/27.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    
    var color: Color = Color(name: "white", hex: "FFFFFF", r: 255, g: 255, b: 255)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = color.name
        self.backLabel.backgroundColor = UIColor(red: CGFloat(color.r!)/255, green: CGFloat(color.g!)/255, blue: CGFloat(color.b!)/255, alpha: 1.0)
    }

}
