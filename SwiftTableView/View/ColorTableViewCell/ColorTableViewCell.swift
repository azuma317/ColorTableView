//
//  ColorTableViewCell.swift
//  SwiftTableView
//
//  Created by AzumaSato on 2020/01/29.
//  Copyright © 2020 Azuma. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!

    static var className: String {
        return String(describing: type(of: self))
    }

    func configure(_ color: Color) {
        colorNameLabel.text = color.name
        colorView.backgroundColor = UIColor(red: CGFloat(color.rgb[0]/255), green: CGFloat(color.rgb[1]/255), blue: CGFloat(color.rgb[2]/255), alpha: 1)
    }
}
