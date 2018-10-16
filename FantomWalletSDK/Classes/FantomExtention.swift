//
//  FantomExtention.swift
//  FantomWalletSDK
//
//  Created by namdo on 2018. 10. 2..
//  Copyright © 2018년 namdo. All rights reserved.
//

import Foundation

public extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    
   mutating public func add(key:String, value:Any) {
        self.updateValue(value as! Value, forKey: key as! Key)
    }
    
    public func jsonToDic(jsonString:String) -> Dictionary<String, Any>? {
        
        if let data = jsonString.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                FantomDefine.logPrint(debug: error.localizedDescription)
            }
        }
        return nil
    }
    
    var jsonString: String? {
        if let dict = (self as AnyObject) as? Dictionary<String, AnyObject> {
            do {
                let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                if let string = String(data: data, encoding: String.Encoding.utf8) {
                    return string
                }
            } catch {
                FantomDefine.logPrint(debug: error.localizedDescription)
            }
        }
        return nil
    }
}
