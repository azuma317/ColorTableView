//
//  ColorStore.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/04/27.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import Foundation

class ColorStore {
    
    enum Result {
        case success([Color])
        case failure(Error)
    }
    
    public static func requestColor(completion: @escaping (Result) -> Void) {
        var colors: [Color] = []
        
        do {
            let path = Bundle.main.path(forResource: "color", ofType: "json")!
            let data = FileHandle(forReadingAtPath: path)?.readDataToEndOfFile()
            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            if let json = json as? [[String:Any]] {
                for colorJSON in json {
                    let hex = colorJSON["hex"] as! String
                    let name = colorJSON["name"] as! String
                    let rgb = colorJSON["rgb"] as! [Int]
                    let color = Color(name: name, hex: hex, r: rgb[0], g: rgb[1], b: rgb[2])
                    colors.append(color)
                }
            }
            completion(.success(colors))
        } catch let error {
            completion(.failure(error))
        }
    }
}
