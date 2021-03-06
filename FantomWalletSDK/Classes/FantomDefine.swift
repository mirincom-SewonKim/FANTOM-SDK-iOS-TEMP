//
//  FantomDefine.swift
//  FantomWalletSDK
//
//  Created by namdo on 2018. 10. 2..
//  Copyright © 2018년 namdo. All rights reserved.
//

import Foundation

public class FantomDefine: NSObject {
    
    public enum interfaceType: Int {
        
        /**
         * clientAuth
         * interface ID : F-FTM-WL-001
         * client auth interface
         * @param clientId(mandatory) : client id
         * @param clientPw(mandatory) : client password
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case clientAuth
        
        /**
         * franchiseList
         * interface ID : IF-FTM-WL-002
         * franchise List interface
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param franchiseSearchNm(optional) : franchise name
         * @param franchiseCd(mandatory) : franchise code
         ex) 000:all, 100:company direct store ,200:franchise, 999:head office
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case franchiseList
        
        /**
         * franchiseDetail
         * interface ID : IF-FTM-WL-003
         * franchise detail info interface
         * @param franchiseId(mandatory) : franchise id
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case franchiseDetail
        
        /**
         * rewardPolicyList
         * interface ID : IF-FTM-WL-004
         * franchise reward policy list interface
         * @param franchiseId(mandatory) : franchise id
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case rewardPolicyList
        
        /**
         * penaltyPolicyList
         * interface ID : IF-FTM-WL-005
         * franchise penalty plicy list interface
         * @param franchiseId(mandatory) : franchise id
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case penaltyPolicyList
        
        /**
         * penaltyPolicyList
         * interface ID : IF-FTM-WL-006
         * franchise reward list interface
         * @param franchiseId(mandatory) : franchise id
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param rewardType(mandatory) : reward type
         ex) 100:FTC reward, 200:FTP reward, 300:FTW reward
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case rewardList
        
        /**
         * penaltyList
         * interface ID : IF-FTM-WL-007
         * franchise penalty list interface
         * @param franchiseId(mandatory) : franchise id
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param penaltyType(mandatory) : penalty type
         ex) 100:FTC penalty, 200:FTP penalty, 300:FTW penalty
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case penaltyList
        
        /**
         * payList
         * interface ID : IF-FTM-WL-008
         * franchise payment list interface
         * @param franchiseId(mandatory) : franchise id
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param payType(mandatory) : pay type
         ex) 100:FTC, 200:FTP, 300:FTW
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case payList
        
        /**
         * payFee
         * interface ID : IF-FTM-WL-009
         * franchise payment fee interface
         * @param franchiseId(mandatory) : franchise id
         * @param payType(mandatory) : pay type
         ex) 100:FTC, 200:FTP, 300:FTW
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case payFee
        
        /**
         * marketPrice
         * interface ID : IF-FTM-WL-010
         * coin market price interface
         * @param franchiseId(mandatory) : franchise id
         * @param coinType(mandatory) : coin type
         ex)100:FTC, 200:FTP, 300:FTW, KRW:korea won, USD:US dollar, RMB:china yuan
         * @param targetCurrencyType(mandatory) : target currency type
         ex)100:FTC, 200:FTP, 300:FTW, KRW:korea won, USD:US dollar, RMB:china yuan
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case marketPrice
        
        /**
         * pay
         * interface ID : IF-FTM-WL-011
         * payment interface
         * @param franchiseId(mandatory) : franchise id
         * @param payCurrencyCd(mandatory) : pay currency code
         ex)100:FTC, 200:FTP, 300:FTW
         * @param payAmount(mandatory) : pay amount
         * @param payFee(mandatory) : pay fee
         * @param payProcSpeed(mandatory) : pay processing speed
         ex)100:slow, 200:usually, 300:fast
         * @param payWalletAddr(mandatory) : pay wallet address
         * @param rewardList(array)
         rewardCalcTargetRangeId(optional): target range ID
         rewardMemo(optional): memo
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case pay
        
        /**
         * reward
         * interface ID : IF-FTM-WL-012
         * reward interface
         * @param franchiseId(mandatory) : franchise id
         * @param rewardReceiveWalletAddr(mandatory) : reward receive wallet address
         * @param rewardList(array)
         rewardCalcTargetRangeId(mandatory): target range ID
         rewardMemo(optional): memo
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case reward
        
        /**
         * payCancel
         * interface ID : IF-FTM-WL-013
         * payment cancel interface
         * @param payTransactionId(mandatory) : payment transaction id
         * @param payCancelAmount(mandatory) : payment cancel amount
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case payCancel
        
        /**
         * rewardCancel
         * interface ID : IF-FTM-WL-014
         * reward cancel interface
         * @param rewardTransactionId(mandatory) : reward transaction id
         * @param reqDate(mandatory)  : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case rewardCancel
        
        /**
         * userLogin
         * interface ID : IF-FTM_WL-015
         * user login interface
         * @param userId(mandatory) : user id
         * @param userPw(mandatory) : user password
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case userLogin
        
        /**
         * userHolding
         * interface ID : IF-FTM_WL-016
         * holding coin interface
         * @param loginAuthKey(mandatory) : login auth key
         * @param coinType(mandatory) : coin type
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case userHolding
        
        /**
         * userWalletAddr
         * interface ID : IF-FTM_WL-017
         * user wallet address interface
         * @param loginAuthKey(mandatory) : login auth key
         * @param coinType(mandatory) : coin type
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case userWalletAddr
        
        /**
         * coinTransfer
         * interface ID : IF-FTM_WL-018
         * coin transfer interface
         * @param loginAuthKey(mandatory) : login auth key
         * @param coinType(mandatory) : coin type
         * @param receiverAddr(mandatory) : receiver address
         * @param amount(mandatory) : amount
         * @param fee(mandatory) : fee
         * @param procSpeedCd(mandatory) : process speed
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case coinTransfer
        
        /**
         * coinConvert
         * interface ID : IF-FTM_WL-019
         * coin convert interface
         * @param loginAuthKey(mandatory) : login auth key
         * @param coinType(mandatory) : coin type
         * @param amount(mandatory) : amount
         * @param fee(mandatory) : fee
         * @param convertCoinType : convert coin type
         * @param procSpeedCd : process speed
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case coinConvert
        
        /**
         * userTransferHist
         * interface ID : IF-FTM_WL-020
         * user transfer history interface
         * @param loginAuthKey(mandatory) : login auth key
         * @param pageNum(mandatory) : page number
         * @param pageCnt(mandatory) : page count
         * @param coinType(mandatory) : coin type
         * @param reqDate(mandatory) : current Date ex)yyyy-MM-dd hh:mm:ss
         */
        case userTransferHist
    }
    struct InterfaceDomain {
        static let domain:String = "wallet-wtest.fantom.services"
    }
        
    struct InterfaceUrn {
        static let fantom_api_0001:String = "/wallet/api/1.0/clientAuth"
        static let fantom_api_0002:String = "/wallet/api/1.0/franchiseList"
        static let fantom_api_0003:String = "/wallet/api/1.0/franchiseDetail"
        static let fantom_api_0004:String = "/wallet/api/1.0/franchiseRewardPolicyList"
        static let fantom_api_0005:String = "/wallet/api/1.0/franchisePenaltyPolicyList"
        static let fantom_api_0006:String = "/wallet/api/1.0/franchiseRewardList"
        static let fantom_api_0007:String = "/wallet/api/1.0/franchisePenaltyList"
        static let fantom_api_0008:String = "/wallet/api/1.0/franchisePayList"
        static let fantom_api_0009:String = "/wallet/api/1.0/franchisePayFee"
        static let fantom_api_0010:String = "/wallet/api/1.0/coinMarketPrice"
        static let fantom_api_0011:String = "/wallet/api/1.0/pay"
        static let fantom_api_0012:String = "/wallet/api/1.0/reward"
        static let fantom_api_0013:String = "/wallet/api/1.0/payCancel"
        static let fantom_api_0014:String = "/wallet/api/1.0/rewardCancel"
        static let fantom_api_0015:String = "/wallet/api/1.0/login"
        static let fantom_api_0016:String = "/wallet/api/1.0/userHolding"
        static let fantom_api_0017:String = "/wallet/api/1.0/userWalletAddr"
        static let fantom_api_0018:String = "/wallet/api/1.0/coinTransfer"
        static let fantom_api_0019:String = "/wallet/api/1.0/coinConvert"
        static let fantom_api_0020:String = "/wallet/api/1.0/userTransferHist"
    }
    
    static func logPrint(debug: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
        if FantomWallet.shared._debugMode {
            let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
            print("<\(fileURL) \(function)[\(line)]: " + "\n\(debug)\n")
        }
        #endif
    }
}
