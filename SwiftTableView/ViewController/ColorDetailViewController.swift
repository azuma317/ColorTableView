//
//  ColorDetailViewController.swift
//  SwiftTableView
//
//  Created by AzumaSato on 2020/01/29.
//  Copyright © 2020 Azuma. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!

    var color: Color!

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure() {
        colorView.backgroundColor = UIColor(red: CGFloat(color.rgb[0])/255.0, green: CGFloat(color.rgb[1])/255.0, blue: CGFloat(color.rgb[2])/255.0, alpha: 1)
        colorNameLabel.text = color.name
        redLabel.text = String(color.rgb[0])
        greenLabel.text = String(color.rgb[1])
        blueLabel.text = String(color.rgb[2])
    }

}
