
//
//  TableViewCell.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/04/27.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hex: UILabel!
    @IBOutlet weak var r: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var b: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configre(color: Color) {
        self.name.text = color.name
        self.hex.text = "Hex:" + color.hex!
        self.r.text = "R:" + String(color.r!)
        self.g.text = "G:" + String(color.g!)
        self.b.text = "B:" + String(color.b!)
        self.color.backgroundColor = UIColor(red: CGFloat(color.r!)/255, green: CGFloat(color.g!)/255, blue: CGFloat(color.b!)/255, alpha: 1.0)
    }

}
