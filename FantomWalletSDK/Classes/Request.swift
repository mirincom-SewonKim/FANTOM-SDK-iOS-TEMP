//
//  Request.swift
//  FantomWalletSDK
//
//  Created by namdo on 2018. 9. 19..
//  Copyright © 2018년 namdo. All rights reserved.
//

import Foundation

class Request {
    
    static func requsetPost(urlStr : String, parameter:String, completion: @escaping (Int, String?, Error?) -> Void) {
        
        let url = URL(string: urlStr);
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("ko-kr", forHTTPHeaderField: "Accept-language")
        request.setValue("gzip, deflate", forHTTPHeaderField: "Accept-encoding")
        request.setValue("WMONID=mW8Z0nAmN70", forHTTPHeaderField: "Cookie")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("", forHTTPHeaderField: "X-Cookie")
        
        if FantomWallet.shared.getAcceseToken().count > 0 {
//            let token = FantomWallet.shared.getAcceseToken()
//            request.setValue(token, forHTTPHeaderField: "authorization")
        }
        
        let paramData = parameter.data(using: .utf8)
        
        request.httpBody = paramData
        
        let decoded = try! JSONSerialization.jsonObject(with: paramData!, options: [])
        FantomDefine.logPrint(debug: "Set HttpHeaders :\n\(request.allHTTPHeaderFields!)")
        FantomDefine.logPrint(debug: "Set requestUrl:\n\(urlStr)")
        FantomDefine.logPrint(debug: "Set Parameter :\n\(decoded)")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            DispatchQueue.main.async {
                
                if error == nil && data != nil {
                    
                    let httpResponse = response as? HTTPURLResponse
                    let statusCode = httpResponse?.statusCode
                    let responseString = String(data: data!, encoding: .utf8)
                    
                    FantomDefine.logPrint(debug: "Http Response :\n\(response!)")
                    FantomDefine.logPrint(debug: "Respons Data :\n\(responseString!)")
                    
                    completion(statusCode!, responseString!, error)
                }
                else {
                    completion(-1, nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    static func requsetGet(urlStr : String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let url = URL(string: urlStr);
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            completion(data, response, error)
        }
        
        task.resume()
    }
}
