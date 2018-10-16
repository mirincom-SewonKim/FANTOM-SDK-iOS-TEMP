//
//  FantomWallet.swift
//  FantomWalletSDK
//
//  Created by namdo on 2018. 9. 19..
//  Copyright © 2018년 namdo. All rights reserved.
//

import Foundation

public class FantomWallet: NSObject {
    
    public var _isHttps:Bool
    public var _debugMode:Bool
    
    private var _accecToken:String
    
    public static let shared = FantomWallet()
    
    override init() {
        _debugMode = true
        _isHttps = true
        _accecToken = ""
    }
    
    private func domain() -> String {
        
        let domain = FantomDefine.InterfaceDomain.domain
        
//        let bundle = Bundle(for: type(of: self))
//        let path = bundle.path(forResource: "Fantom", ofType: "plist")
//
//        if  let myDict = NSDictionary(contentsOfFile: path!) {
//            domain = myDict["FantomWalletDomain"] as! String
//        }
        
        if _isHttps {
            return "https://"+domain
        }
        
        return "http://"+domain
    }

    
    /**
     * setConfig
     * @param debugMode : debug mode on, off (default: true)
     * @param isHttps : http, https selected (default: true)
     */
    public func setConfig (debugMode:Bool, isHttps:Bool)
    {
        _isHttps = isHttps
        _debugMode = debugMode
    }
    
    /**
     * setAcceseToken
     * @param tokenType
     * @param accessToken
     */
    public func setAcceseToken (tokenType:String, accessToken:String) {
        
        if tokenType.count > 0 && accessToken.count > 0 {
            _accecToken = tokenType+" "+accessToken
        }
        else {
            _accecToken = ""
        }
    }
    
    /**
     * getAcceseToken
     * @returns accecToken
     */
    public func getAcceseToken() -> String {
        return _accecToken
    }
    
    /**
     * reqApi
     * interface requst funtion
     * @param interfaceType(mandatory) : interface type
     * @param parameter(mandatory) : json object
     * @completion : <httpStatusCode, jsonString, error>
     */
    public func reqApi(interfaceType:FantomDefine.interfaceType, parameter:String, completion: @escaping (Int, String?, Error?) -> Void) {
        
        var urn = String()
        
        switch interfaceType {
        case .clientAuth:
            urn = FantomDefine.InterfaceUrn.fantom_api_0001
            break
        case .franchiseList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0002
            break
        case .franchiseDetail:
            urn = FantomDefine.InterfaceUrn.fantom_api_0003
            break
        case .rewardPolicyList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0004
            break
        case .penaltyPolicyList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0005
            break
        case .rewardList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0006
            break
        case .penaltyList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0007
            break
        case .payList:
            urn = FantomDefine.InterfaceUrn.fantom_api_0008
            break
        case .payFee:
            urn = FantomDefine.InterfaceUrn.fantom_api_0009
            break
        case .marketPrice:
            urn = FantomDefine.InterfaceUrn.fantom_api_0010
            break
        case .pay:
            urn = FantomDefine.InterfaceUrn.fantom_api_0011
            break
        case .reward:
            urn = FantomDefine.InterfaceUrn.fantom_api_0012
            break
        case .payCancel:
            urn = FantomDefine.InterfaceUrn.fantom_api_0013
            break
        case .rewardCancel:
            urn = FantomDefine.InterfaceUrn.fantom_api_0014
            break
        }
        
        FantomDefine.logPrint(debug: "Call interface: \(interfaceType)")
        Request.requsetPost(urlStr: domain()+urn, parameter: parameter) { (statusCode, responseString, error) in
            
            completion(statusCode, responseString, error)
        }
    }
    
    deinit {
        _debugMode = true
        _isHttps = true
        
        _accecToken = ""
    }
}
