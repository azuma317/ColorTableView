//
//  RealmColor.swift
//  SwiftTableView
//
//  Created by Azuma on 2018/05/01.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmColor: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var hex = ""
    @objc dynamic var r = 0
    @objc dynamic var g = 0
    @objc dynamic var b = 0
    
    override init(value: Any) {
        super.init(value: value)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    func mapping(value: Any) {
        if let value = value as? [String:Any],
            let rgb = value["rgb"] as? [Int],
            rgb.count == 3,
            let r = rgb.first,
            let g = rgb[1] as? Int,
            let b = rgb.last {
            self.r = r
            self.g = g
            self.b = b
        }
    }
    
    public static func addColor(colorJSONs: [[String:Any]]) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                for colorJSON in colorJSONs {
                    let color = RealmColor(value: colorJSON)
                    realm.add(color, update: true)
                }
            }
        }
    }
    
}
