//
//  Color.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/04/27.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import Foundation

class Color: NSObject{
    
    let name: String?
    let hex: String?
    let r: Int?
    let g: Int?
    let b: Int?
    
    init(name: String, hex: String, r: Int, g: Int, b: Int) {
        self.name = name
        self.hex = hex
        self.r = r
        self.g = g
        self.b = b
    }
}
