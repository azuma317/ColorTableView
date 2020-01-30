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
        do {
            let path = Bundle.main.path(forResource: "color", ofType: "json")!
            let data = FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
            let decoder = JSONDecoder()
            let colors = try decoder.decode([Color].self, from: data)
            completion(.success(colors))
        } catch let error {
            completion(.failure(error))
        }
    }
}
