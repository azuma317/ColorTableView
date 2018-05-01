//
//  APIClient.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/05/01.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import Foundation

class APIClient {
    
    enum Result {
        case success([[String:Any]])
        case failure(Error)
    }
    
    public static func requestColor(completion: @escaping (Result) -> Void) {
        
        do {
            let path = Bundle.main.path(forResource: "color", ofType: "json")!
            let data = FileHandle(forReadingAtPath: path)?.readDataToEndOfFile()
            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            if let json = json as? [[String:Any]] {
                completion(.success(json))
                return
            }
        } catch let error {
            completion(.failure(error))
        }
    }
    
}
