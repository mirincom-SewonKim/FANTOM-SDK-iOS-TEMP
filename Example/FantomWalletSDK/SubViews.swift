//
//  SubViews.swift
//  FantomWalletSDK_Example
//
//  Created by namdo on 2018. 10. 16..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import FantomWalletSDK

class UserTransferHistView : UIView, UITextFieldDelegate {
    
    var loginAuthKeyField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var coinTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let loginAuthKeyLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        loginAuthKeyLb.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyLb.text = "loginAuthKey :"
        subView.addSubview(loginAuthKeyLb)
        
        let loginAuthKeyPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        loginAuthKeyField = UITextField(frame: CGRect(x: loginAuthKeyLb.frame.maxX, y: loginAuthKeyLb.frame.minY, width: 120, height: 30))
        loginAuthKeyField.delegate = self
        loginAuthKeyField.leftView = loginAuthKeyPadingView
        loginAuthKeyField.rightView = loginAuthKeyPadingView
        loginAuthKeyField.leftViewMode = .always
        loginAuthKeyField.rightViewMode = .always
        loginAuthKeyField.inputAccessoryView = toolBar
        loginAuthKeyField.layer.masksToBounds = true
        loginAuthKeyField.layer.borderColor = UIColor.black.cgColor
        loginAuthKeyField.layer.borderWidth = 1.0
        loginAuthKeyField.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyField.placeholder = "Mandatory"
        subView.addSubview(loginAuthKeyField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: loginAuthKeyLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "pageNum :"
        subView.addSubview(pageNumLb)
        
        let pageNumPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = pageNumPadingView
        pageNumField.rightView = pageNumPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "pageCnt :"
        subView.addSubview(pageCntLb)
        
        let pageCntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = pageCntPadingView
        pageCntField.rightView = pageCntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        subView.addSubview(pageCntField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: pageCntLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "coinType :"
        subView.addSubview(coinTypeLb)
        
        let coinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinTypePadingView
        coinTypeField.rightView = coinTypePadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        subView.addSubview(coinTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: coinTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "loginAuthKey", value: loginAuthKeyField.text!)
        parameter.add(key: "pageNum", value: pageNumField.text!)
        parameter.add(key: "pageCnt", value: pageCntField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .userTransferHist, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}


class CoinConvertView : UIView, UITextFieldDelegate {

    var loginAuthKeyField = UITextField()
    var coinTypeField = UITextField()
    var amountField = UITextField()
    var feeField = UITextField()
    var convertCoinTypeField = UITextField()
    var procSpeedCdField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let loginAuthKeyLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        loginAuthKeyLb.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyLb.text = "loginAuthKey :"
        subView.addSubview(loginAuthKeyLb)
        
        let loginAuthKeyPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        loginAuthKeyField = UITextField(frame: CGRect(x: loginAuthKeyLb.frame.maxX, y: loginAuthKeyLb.frame.minY, width: 120, height: 30))
        loginAuthKeyField.delegate = self
        loginAuthKeyField.leftView = loginAuthKeyPadingView
        loginAuthKeyField.rightView = loginAuthKeyPadingView
        loginAuthKeyField.leftViewMode = .always
        loginAuthKeyField.rightViewMode = .always
        loginAuthKeyField.inputAccessoryView = toolBar
        loginAuthKeyField.layer.masksToBounds = true
        loginAuthKeyField.layer.borderColor = UIColor.black.cgColor
        loginAuthKeyField.layer.borderWidth = 1.0
        loginAuthKeyField.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyField.placeholder = "Mandatory"
        subView.addSubview(loginAuthKeyField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: loginAuthKeyLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "coinType :"
        subView.addSubview(coinTypeLb)
        
        let coinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinTypePadingView
        coinTypeField.rightView = coinTypePadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        subView.addSubview(coinTypeField)
        
        let amountLb = UILabel(frame: CGRect(x: 4, y: coinTypeLb.frame.maxY+4, width: 120, height: 30))
        amountLb.font = UIFont.systemFont(ofSize: 16)
        amountLb.text = "amount :"
        subView.addSubview(amountLb)
        
        let amountPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        amountField = UITextField(frame: CGRect(x: amountLb.frame.maxX, y: amountLb.frame.minY, width: 120, height: 30))
        amountField.delegate = self
        amountField.leftView = amountPadingView
        amountField.rightView = amountPadingView
        amountField.leftViewMode = .always
        amountField.rightViewMode = .always
        amountField.inputAccessoryView = toolBar
        amountField.layer.masksToBounds = true
        amountField.layer.borderColor = UIColor.black.cgColor
        amountField.layer.borderWidth = 1.0
        amountField.font = UIFont.systemFont(ofSize: 16)
        amountField.placeholder = "Mandatory"
        subView.addSubview(amountField)
        
        let feeLb = UILabel(frame: CGRect(x: 4, y: amountLb.frame.maxY+4, width: 120, height: 30))
        feeLb.font = UIFont.systemFont(ofSize: 16)
        feeLb.text = "fee :"
        subView.addSubview(feeLb)
        
        let feePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        feeField = UITextField(frame: CGRect(x: feeLb.frame.maxX, y: feeLb.frame.minY, width: 120, height: 30))
        feeField.delegate = self
        feeField.leftView = feePadingView
        feeField.rightView = feePadingView
        feeField.leftViewMode = .always
        feeField.rightViewMode = .always
        feeField.inputAccessoryView = toolBar
        feeField.layer.masksToBounds = true
        feeField.layer.borderColor = UIColor.black.cgColor
        feeField.layer.borderWidth = 1.0
        feeField.font = UIFont.systemFont(ofSize: 16)
        feeField.placeholder = "Mandatory"
        subView.addSubview(feeField)
        
        let convertCoinTypeLb = UILabel(frame: CGRect(x: 4, y: feeLb.frame.maxY+4, width: 120, height: 30))
        convertCoinTypeLb.font = UIFont.systemFont(ofSize: 16)
        convertCoinTypeLb.text = "convertCoinType :"
        subView.addSubview(convertCoinTypeLb)
        
        let convertCoinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        convertCoinTypeField = UITextField(frame: CGRect(x: convertCoinTypeLb.frame.maxX, y: convertCoinTypeLb.frame.minY, width: 120, height: 30))
        convertCoinTypeField.delegate = self
        convertCoinTypeField.leftView = convertCoinTypePadingView
        convertCoinTypeField.rightView = convertCoinTypePadingView
        convertCoinTypeField.leftViewMode = .always
        convertCoinTypeField.rightViewMode = .always
        convertCoinTypeField.inputAccessoryView = toolBar
        convertCoinTypeField.layer.masksToBounds = true
        convertCoinTypeField.layer.borderColor = UIColor.black.cgColor
        convertCoinTypeField.layer.borderWidth = 1.0
        convertCoinTypeField.font = UIFont.systemFont(ofSize: 16)
        convertCoinTypeField.placeholder = "Mandatory"
        subView.addSubview(convertCoinTypeField)
        
        let procSpeedCdLb = UILabel(frame: CGRect(x: 4, y: convertCoinTypeLb.frame.maxY+4, width: 120, height: 30))
        procSpeedCdLb.font = UIFont.systemFont(ofSize: 16)
        procSpeedCdLb.text = "procSpeedCd :"
        subView.addSubview(procSpeedCdLb)
        
        let procSpeedCdPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        procSpeedCdField = UITextField(frame: CGRect(x: procSpeedCdLb.frame.maxX, y: procSpeedCdLb.frame.minY, width: 120, height: 30))
        procSpeedCdField.delegate = self
        procSpeedCdField.leftView = procSpeedCdPadingView
        procSpeedCdField.rightView = procSpeedCdPadingView
        procSpeedCdField.leftViewMode = .always
        procSpeedCdField.rightViewMode = .always
        procSpeedCdField.inputAccessoryView = toolBar
        procSpeedCdField.layer.masksToBounds = true
        procSpeedCdField.layer.borderColor = UIColor.black.cgColor
        procSpeedCdField.layer.borderWidth = 1.0
        procSpeedCdField.font = UIFont.systemFont(ofSize: 16)
        procSpeedCdField.placeholder = "Mandatory"
        subView.addSubview(procSpeedCdField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: procSpeedCdLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        let fee = Int(feeField.text!)
        let amount = Int(amountField.text!)
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "loginAuthKey", value: loginAuthKeyField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "amount", value: NSNumber(integerLiteral: amount!))
        parameter.add(key: "fee", value: NSNumber(integerLiteral: fee!))
        parameter.add(key: "convertCoinType", value: convertCoinTypeField.text!)
        parameter.add(key: "procSpeedCd", value: procSpeedCdField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .coinConvert, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class CoinTransferView : UIView, UITextFieldDelegate {
    
    var loginAuthKeyField = UITextField()
    var coinTypeField = UITextField()
    var receiverAddrField = UITextField()
    var amountField = UITextField()
    var feeField = UITextField()
    var procSpeedCdField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let loginAuthKeyLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        loginAuthKeyLb.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyLb.text = "loginAuthKey :"
        subView.addSubview(loginAuthKeyLb)
        
        let loginAuthKeyPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        loginAuthKeyField = UITextField(frame: CGRect(x: loginAuthKeyLb.frame.maxX, y: loginAuthKeyLb.frame.minY, width: 120, height: 30))
        loginAuthKeyField.delegate = self
        loginAuthKeyField.leftView = loginAuthKeyPadingView
        loginAuthKeyField.rightView = loginAuthKeyPadingView
        loginAuthKeyField.leftViewMode = .always
        loginAuthKeyField.rightViewMode = .always
        loginAuthKeyField.inputAccessoryView = toolBar
        loginAuthKeyField.layer.masksToBounds = true
        loginAuthKeyField.layer.borderColor = UIColor.black.cgColor
        loginAuthKeyField.layer.borderWidth = 1.0
        loginAuthKeyField.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyField.placeholder = "Mandatory"
        subView.addSubview(loginAuthKeyField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: loginAuthKeyLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "coinType :"
        subView.addSubview(coinTypeLb)
        
        let coinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinTypePadingView
        coinTypeField.rightView = coinTypePadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        coinTypeField.text = "100"
        subView.addSubview(coinTypeField)
        
        let receiverAddrLb = UILabel(frame: CGRect(x: 4, y: coinTypeLb.frame.maxY+4, width: 120, height: 30))
        receiverAddrLb.font = UIFont.systemFont(ofSize: 16)
        receiverAddrLb.text = "receiverAddr :"
        subView.addSubview(receiverAddrLb)
        
        let receiverAddrPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        receiverAddrField = UITextField(frame: CGRect(x: receiverAddrLb.frame.maxX, y: receiverAddrLb.frame.minY, width: 120, height: 30))
        receiverAddrField.delegate = self
        receiverAddrField.leftView = receiverAddrPadingView
        receiverAddrField.rightView = receiverAddrPadingView
        receiverAddrField.leftViewMode = .always
        receiverAddrField.rightViewMode = .always
        receiverAddrField.inputAccessoryView = toolBar
        receiverAddrField.layer.masksToBounds = true
        receiverAddrField.layer.borderColor = UIColor.black.cgColor
        receiverAddrField.layer.borderWidth = 1.0
        receiverAddrField.font = UIFont.systemFont(ofSize: 16)
        receiverAddrField.placeholder = "Mandatory"
        receiverAddrField.text = "63880a5422fd4a8a98fba491de2119a2"
        subView.addSubview(receiverAddrField)
        
        let amountLb = UILabel(frame: CGRect(x: 4, y: receiverAddrLb.frame.maxY+4, width: 120, height: 30))
        amountLb.font = UIFont.systemFont(ofSize: 16)
        amountLb.text = "amount :"
        subView.addSubview(amountLb)
        
        let amountPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        amountField = UITextField(frame: CGRect(x: amountLb.frame.maxX, y: amountLb.frame.minY, width: 120, height: 30))
        amountField.delegate = self
        amountField.leftView = amountPadingView
        amountField.rightView = amountPadingView
        amountField.leftViewMode = .always
        amountField.rightViewMode = .always
        amountField.inputAccessoryView = toolBar
        amountField.layer.masksToBounds = true
        amountField.layer.borderColor = UIColor.black.cgColor
        amountField.layer.borderWidth = 1.0
        amountField.font = UIFont.systemFont(ofSize: 16)
        amountField.placeholder = "Mandatory"
        amountField.text = "100"
        subView.addSubview(amountField)
        
        let feeLb = UILabel(frame: CGRect(x: 4, y: amountLb.frame.maxY+4, width: 120, height: 30))
        feeLb.font = UIFont.systemFont(ofSize: 16)
        feeLb.text = "fee :"
        subView.addSubview(feeLb)
        
        let feePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        feeField = UITextField(frame: CGRect(x: feeLb.frame.maxX, y: feeLb.frame.minY, width: 120, height: 30))
        feeField.delegate = self
        feeField.leftView = feePadingView
        feeField.rightView = feePadingView
        feeField.leftViewMode = .always
        feeField.rightViewMode = .always
        feeField.inputAccessoryView = toolBar
        feeField.layer.masksToBounds = true
        feeField.layer.borderColor = UIColor.black.cgColor
        feeField.layer.borderWidth = 1.0
        feeField.font = UIFont.systemFont(ofSize: 16)
        feeField.placeholder = "Mandatory"
        feeField.text = "10"
        subView.addSubview(feeField)
        
        let procSpeedCdLb = UILabel(frame: CGRect(x: 4, y: feeLb.frame.maxY+4, width: 120, height: 30))
        procSpeedCdLb.font = UIFont.systemFont(ofSize: 16)
        procSpeedCdLb.text = "procSpeedCd :"
        subView.addSubview(procSpeedCdLb)
        
        let procSpeedCdPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        procSpeedCdField = UITextField(frame: CGRect(x: procSpeedCdLb.frame.maxX, y: procSpeedCdLb.frame.minY, width: 120, height: 30))
        procSpeedCdField.delegate = self
        procSpeedCdField.leftView = procSpeedCdPadingView
        procSpeedCdField.rightView = procSpeedCdPadingView
        procSpeedCdField.leftViewMode = .always
        procSpeedCdField.rightViewMode = .always
        procSpeedCdField.inputAccessoryView = toolBar
        procSpeedCdField.layer.masksToBounds = true
        procSpeedCdField.layer.borderColor = UIColor.black.cgColor
        procSpeedCdField.layer.borderWidth = 1.0
        procSpeedCdField.font = UIFont.systemFont(ofSize: 16)
        procSpeedCdField.placeholder = "Mandatory"
        procSpeedCdField.text = "100"
        subView.addSubview(procSpeedCdField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: procSpeedCdLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        let fee = Int(feeField.text!)
        let amount = Int(amountField.text!)
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "loginAuthKey", value: loginAuthKeyField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "receiverAddr", value: receiverAddrField.text!)
        parameter.add(key: "amount", value: NSNumber(integerLiteral: amount!))
        parameter.add(key: "fee", value: NSNumber(integerLiteral: fee!))
        parameter.add(key: "procSpeedCd", value: procSpeedCdField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .coinTransfer, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class UserWalletAddrView : UIView, UITextFieldDelegate {
    
    var loginAuthKeyField = UITextField()
    var userIdField = UITextField()
    var coinTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let loginAuthKeyLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        loginAuthKeyLb.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyLb.text = "loginAuthKey :"
        subView.addSubview(loginAuthKeyLb)
        
        let loginAuthKeyPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        loginAuthKeyField = UITextField(frame: CGRect(x: loginAuthKeyLb.frame.maxX, y: loginAuthKeyLb.frame.minY, width: 120, height: 30))
        loginAuthKeyField.delegate = self
        loginAuthKeyField.leftView = loginAuthKeyPadingView
        loginAuthKeyField.rightView = loginAuthKeyPadingView
        loginAuthKeyField.leftViewMode = .always
        loginAuthKeyField.rightViewMode = .always
        loginAuthKeyField.inputAccessoryView = toolBar
        loginAuthKeyField.layer.masksToBounds = true
        loginAuthKeyField.layer.borderColor = UIColor.black.cgColor
        loginAuthKeyField.layer.borderWidth = 1.0
        loginAuthKeyField.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyField.placeholder = "Mandatory"
        subView.addSubview(loginAuthKeyField)
        
        let userIdLb = UILabel(frame: CGRect(x:4, y:loginAuthKeyLb.frame.maxY+4, width: 120, height: 30))
        userIdLb.font = UIFont.systemFont(ofSize: 16)
        userIdLb.text = "userId :"
        subView.addSubview(userIdLb)
        
        let userIdPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        userIdField = UITextField(frame: CGRect(x: userIdLb.frame.maxX, y: userIdLb.frame.minY, width: 120, height: 30))
        userIdField.delegate = self
        userIdField.leftView = userIdPadingView
        userIdField.rightView = userIdPadingView
        userIdField.leftViewMode = .always
        userIdField.rightViewMode = .always
        userIdField.inputAccessoryView = toolBar
        userIdField.layer.masksToBounds = true
        userIdField.layer.borderColor = UIColor.black.cgColor
        userIdField.layer.borderWidth = 1.0
        userIdField.font = UIFont.systemFont(ofSize: 16)
        userIdField.placeholder = "Mandatory"
        subView.addSubview(userIdField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: userIdLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "coinType :"
        subView.addSubview(coinTypeLb)
        
        let coinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinTypePadingView
        coinTypeField.rightView = coinTypePadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        subView.addSubview(coinTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: coinTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "loginAuthKey", value: loginAuthKeyField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .userWalletAddr, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class UserHoldingView : UIView, UITextFieldDelegate {
    
    var loginAuthKeyField = UITextField()
    var userIdField = UITextField()
    var coinTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let loginAuthKeyLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        loginAuthKeyLb.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyLb.text = "loginAuthKey :"
        subView.addSubview(loginAuthKeyLb)
        
        let loginAuthKeyPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        loginAuthKeyField = UITextField(frame: CGRect(x: loginAuthKeyLb.frame.maxX, y: loginAuthKeyLb.frame.minY, width: 120, height: 30))
        loginAuthKeyField.delegate = self
        loginAuthKeyField.leftView = loginAuthKeyPadingView
        loginAuthKeyField.rightView = loginAuthKeyPadingView
        loginAuthKeyField.leftViewMode = .always
        loginAuthKeyField.rightViewMode = .always
        loginAuthKeyField.inputAccessoryView = toolBar
        loginAuthKeyField.layer.masksToBounds = true
        loginAuthKeyField.layer.borderColor = UIColor.black.cgColor
        loginAuthKeyField.layer.borderWidth = 1.0
        loginAuthKeyField.font = UIFont.systemFont(ofSize: 16)
        loginAuthKeyField.placeholder = "Mandatory"
        subView.addSubview(loginAuthKeyField)
        
        let userIdLb = UILabel(frame: CGRect(x:4, y:loginAuthKeyLb.frame.maxY+4, width: 120, height: 30))
        userIdLb.font = UIFont.systemFont(ofSize: 16)
        userIdLb.text = "userId :"
        subView.addSubview(userIdLb)
        
        let userIdPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        userIdField = UITextField(frame: CGRect(x: userIdLb.frame.maxX, y: userIdLb.frame.minY, width: 120, height: 30))
        userIdField.delegate = self
        userIdField.leftView = userIdPadingView
        userIdField.rightView = userIdPadingView
        userIdField.leftViewMode = .always
        userIdField.rightViewMode = .always
        userIdField.inputAccessoryView = toolBar
        userIdField.layer.masksToBounds = true
        userIdField.layer.borderColor = UIColor.black.cgColor
        userIdField.layer.borderWidth = 1.0
        userIdField.font = UIFont.systemFont(ofSize: 16)
        userIdField.placeholder = "Mandatory"
        subView.addSubview(userIdField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: userIdLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "coinType :"
        subView.addSubview(coinTypeLb)
        
        let coinTypePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinTypePadingView
        coinTypeField.rightView = coinTypePadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        subView.addSubview(coinTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: coinTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "loginAuthKey", value: loginAuthKeyField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .userHolding, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
    
}

class UserLoginView : UIView, UITextFieldDelegate {
    
    var userIdField = UITextField()
    var userPasswordField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let userIdLb = UILabel(frame: CGRect(x:4, y:4, width: 120, height: 30))
        userIdLb.font = UIFont.systemFont(ofSize: 16)
        userIdLb.text = "userId :"
        subView.addSubview(userIdLb)
        
        let userIdPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        userIdField = UITextField(frame: CGRect(x: userIdLb.frame.maxX, y: userIdLb.frame.minY, width: 120, height: 30))
        userIdField.delegate = self
        userIdField.leftView = userIdPadingView
        userIdField.rightView = userIdPadingView
        userIdField.leftViewMode = .always
        userIdField.rightViewMode = .always
        userIdField.inputAccessoryView = toolBar
        userIdField.layer.masksToBounds = true
        userIdField.layer.borderColor = UIColor.black.cgColor
        userIdField.layer.borderWidth = 1.0
        userIdField.font = UIFont.systemFont(ofSize: 16)
        userIdField.placeholder = "Mandatory"
        subView.addSubview(userIdField)
        
        let userPwLb = UILabel(frame: CGRect(x: 4, y: userIdLb.frame.maxY+4, width: 120, height: 30))
        userPwLb.font = UIFont.systemFont(ofSize: 16)
        userPwLb.text = "userPw :"
        subView.addSubview(userPwLb)
        
        let userPwPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        userPasswordField = UITextField(frame: CGRect(x: userPwLb.frame.maxX, y: userPwLb.frame.minY, width: 120, height: 30))
        userPasswordField.delegate = self
        userPasswordField.leftView = userPwPadingView
        userPasswordField.rightView = userPwPadingView
        userPasswordField.leftViewMode = .always
        userPasswordField.rightViewMode = .always
        userPasswordField.inputAccessoryView = toolBar
        userPasswordField.layer.masksToBounds = true
        userPasswordField.layer.borderColor = UIColor.black.cgColor
        userPasswordField.layer.borderWidth = 1.0
        userPasswordField.font = UIFont.systemFont(ofSize: 16)
        userPasswordField.placeholder = "Mandatory"
        subView.addSubview(userPasswordField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: userPwLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var password = userPasswordField.text!
        var cryptoPassword = ccSha256(data: password.data(using: .utf8)!)

        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "userId", value: userIdField.text!)
        parameter.add(key: "userPw", value: cryptoPassword.map { String(format: "%02hhx", $0) }.joined())
        parameter.add(key: "reqDate", value: getCurrentDate())

        FantomWallet.shared.reqApi(interfaceType: .userLogin, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in

            if resData != nil {

                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!

                if statusCode == 200 {

                    let rsltTp:String = dic["rsltTp"] as! String

                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
    
    func ccSha256(data: Data) -> Data {
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digest.withUnsafeMutableBytes { (digestBytes) in
            data.withUnsafeBytes { (stringBytes) in
                CC_SHA256(stringBytes, CC_LONG(data.count), digestBytes)
            }
        }
        return digest
    }
}


class FranchiseListView : UIView, UITextFieldDelegate {
    
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var searchNmField = UITextField()
    var codeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let searchLb = UILabel(frame: CGRect(x: 4, y: pageCntLb.frame.maxY+4, width: 120, height: 30))
        searchLb.font = UIFont.systemFont(ofSize: 16)
        searchLb.text = "SearchName :"
        subView.addSubview(searchLb)
        
        let searchPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        searchNmField = UITextField(frame: CGRect(x: searchLb.frame.maxX, y: searchLb.frame.minY, width: 120, height: 30))
        searchNmField.delegate = self
        searchNmField.leftView = searchPadingView
        searchNmField.rightView = searchPadingView
        searchNmField.leftViewMode = .always
        searchNmField.rightViewMode = .always
        searchNmField.layer.masksToBounds = true
        searchNmField.layer.borderColor = UIColor.black.cgColor
        searchNmField.layer.borderWidth = 1.0
        searchNmField.font = UIFont.systemFont(ofSize: 16)
        searchNmField.placeholder = "Optional"
        subView.addSubview(searchNmField)
        
        let codeLb = UILabel(frame: CGRect(x: 4, y: searchLb.frame.maxY+4, width: 120, height: 30))
        codeLb.font = UIFont.systemFont(ofSize: 16)
        codeLb.text = "Code :"
        subView.addSubview(codeLb)
        
        let codePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        codeField = UITextField(frame: CGRect(x: codeLb.frame.maxX, y: codeLb.frame.minY, width: 120, height: 30))
        codeField.delegate = self
        codeField.leftView = codePadingView
        codeField.rightView = codePadingView
        codeField.leftViewMode = .always
        codeField.rightViewMode = .always
        codeField.inputAccessoryView = toolBar
        codeField.layer.masksToBounds = true
        codeField.layer.borderColor = UIColor.black.cgColor
        codeField.layer.borderWidth = 1.0
        codeField.keyboardType = .numberPad
        codeField.font = UIFont.systemFont(ofSize: 16)
        codeField.placeholder = "Mandatory"
        codeField.text = "000"
        subView.addSubview(codeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: codeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "franchiseSearchNm", value: searchNmField.text!)
        parameter.add(key: "franchiseCd", value: codeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .franchiseList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchiseInfoView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: 4, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.keyboardType = .numberPad
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: franchiseIdLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .franchiseDetail, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchiseRewardPolicyListView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: pageCntLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .rewardPolicyList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchisePenaltyPolicyListView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: pageCntLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .penaltyPolicyList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchiseRewardListView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var rewardTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let rewardTypeLb = UILabel(frame: CGRect(x: 4, y: pageCntLb.frame.maxY+4, width: 120, height: 30))
        rewardTypeLb.font = UIFont.systemFont(ofSize: 16)
        rewardTypeLb.text = "RewardType :"
        subView.addSubview(rewardTypeLb)
        
        let rPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        rewardTypeField = UITextField(frame: CGRect(x: rewardTypeLb.frame.maxX, y: rewardTypeLb.frame.minY, width: 120, height: 30))
        rewardTypeField.delegate = self
        rewardTypeField.leftView = rPadingView
        rewardTypeField.rightView = rPadingView
        rewardTypeField.leftViewMode = .always
        rewardTypeField.rightViewMode = .always
        rewardTypeField.inputAccessoryView = toolBar
        rewardTypeField.layer.masksToBounds = true
        rewardTypeField.layer.borderColor = UIColor.black.cgColor
        rewardTypeField.layer.borderWidth = 1.0
        rewardTypeField.keyboardType = .numberPad
        rewardTypeField.font = UIFont.systemFont(ofSize: 16)
        rewardTypeField.placeholder = "Mandatory"
        rewardTypeField.text = "100"
        subView.addSubview(rewardTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: rewardTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "rewardType", value: rewardTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .rewardList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchisePenaltyListView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var penaltyTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let penaltyTypeLb = UILabel(frame: CGRect(x: 4, y: pageCntLb.frame.maxY+4, width: 120, height: 30))
        penaltyTypeLb.font = UIFont.systemFont(ofSize: 16)
        penaltyTypeLb.text = "PenaltyType :"
        subView.addSubview(penaltyTypeLb)
        
        let pPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        penaltyTypeField = UITextField(frame: CGRect(x: penaltyTypeLb.frame.maxX, y: penaltyTypeLb.frame.minY, width: 120, height: 30))
        penaltyTypeField.delegate = self
        penaltyTypeField.leftView = pPadingView
        penaltyTypeField.rightView = pPadingView
        penaltyTypeField.leftViewMode = .always
        penaltyTypeField.rightViewMode = .always
        penaltyTypeField.inputAccessoryView = toolBar
        penaltyTypeField.layer.masksToBounds = true
        penaltyTypeField.layer.borderColor = UIColor.black.cgColor
        penaltyTypeField.layer.borderWidth = 1.0
        penaltyTypeField.keyboardType = .numberPad
        penaltyTypeField.font = UIFont.systemFont(ofSize: 16)
        penaltyTypeField.placeholder = "Mandatory"
        penaltyTypeField.text = "100"
        subView.addSubview(penaltyTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: penaltyTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "penaltyType", value: penaltyTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .penaltyList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchisePayListView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var pageNumField = UITextField()
    var pageCntField = UITextField()
    var payTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let pageNumLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        pageNumLb.font = UIFont.systemFont(ofSize: 16)
        pageNumLb.text = "PageNum :"
        subView.addSubview(pageNumLb)
        
        let numPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageNumField = UITextField(frame: CGRect(x: pageNumLb.frame.maxX, y: pageNumLb.frame.minY, width: 120, height: 30))
        pageNumField.delegate = self
        pageNumField.leftView = numPadingView
        pageNumField.rightView = numPadingView
        pageNumField.leftViewMode = .always
        pageNumField.rightViewMode = .always
        pageNumField.inputAccessoryView = toolBar
        pageNumField.layer.masksToBounds = true
        pageNumField.layer.borderColor = UIColor.black.cgColor
        pageNumField.layer.borderWidth = 1.0
        pageNumField.keyboardType = .numberPad
        pageNumField.font = UIFont.systemFont(ofSize: 16)
        pageNumField.placeholder = "Mandatory"
        pageNumField.text = "1"
        subView.addSubview(pageNumField)
        
        let pageCntLb = UILabel(frame: CGRect(x: 4, y: pageNumLb.frame.maxY+4, width: 120, height: 30))
        pageCntLb.font = UIFont.systemFont(ofSize: 16)
        pageCntLb.text = "PageCnt :"
        subView.addSubview(pageCntLb)
        
        let cntPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pageCntField = UITextField(frame: CGRect(x: pageCntLb.frame.maxX, y: pageCntLb.frame.minY, width: 120, height: 30))
        pageCntField.delegate = self
        pageCntField.leftView = cntPadingView
        pageCntField.rightView = cntPadingView
        pageCntField.leftViewMode = .always
        pageCntField.rightViewMode = .always
        pageCntField.inputAccessoryView = toolBar
        pageCntField.layer.masksToBounds = true
        pageCntField.layer.borderColor = UIColor.black.cgColor
        pageCntField.layer.borderWidth = 1.0
        pageCntField.keyboardType = .numberPad
        pageCntField.font = UIFont.systemFont(ofSize: 16)
        pageCntField.placeholder = "Mandatory"
        pageCntField.text = "10"
        subView.addSubview(pageCntField)
        
        let payTypeLb = UILabel(frame: CGRect(x: 4, y: pageCntLb.frame.maxY+4, width: 120, height: 30))
        payTypeLb.font = UIFont.systemFont(ofSize: 16)
        payTypeLb.text = "PayType :"
        subView.addSubview(payTypeLb)
        
        let pPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        payTypeField = UITextField(frame: CGRect(x: payTypeLb.frame.maxX, y: payTypeLb.frame.minY, width: 120, height: 30))
        payTypeField.delegate = self
        payTypeField.leftView = pPadingView
        payTypeField.rightView = pPadingView
        payTypeField.leftViewMode = .always
        payTypeField.rightViewMode = .always
        payTypeField.inputAccessoryView = toolBar
        payTypeField.layer.masksToBounds = true
        payTypeField.layer.borderColor = UIColor.black.cgColor
        payTypeField.layer.borderWidth = 1.0
        payTypeField.keyboardType = .numberPad
        payTypeField.font = UIFont.systemFont(ofSize: 16)
        payTypeField.placeholder = "Mandatory"
        payTypeField.text = "100"
        subView.addSubview(payTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: payTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "pageNum", value: Int(pageNumField.text!)!)
        parameter.add(key: "pageCnt", value: Int(pageCntField.text!)!)
        parameter.add(key: "payType", value: payTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .payList, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class FranchisePayFeeInfoView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var payTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let payTypeLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        payTypeLb.font = UIFont.systemFont(ofSize: 16)
        payTypeLb.text = "PayType :"
        subView.addSubview(payTypeLb)
        
        let pPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        payTypeField = UITextField(frame: CGRect(x: payTypeLb.frame.maxX, y: payTypeLb.frame.minY, width: 120, height: 30))
        payTypeField.delegate = self
        payTypeField.leftView = pPadingView
        payTypeField.rightView = pPadingView
        payTypeField.leftViewMode = .always
        payTypeField.rightViewMode = .always
        payTypeField.inputAccessoryView = toolBar
        payTypeField.layer.masksToBounds = true
        payTypeField.layer.borderColor = UIColor.black.cgColor
        payTypeField.layer.borderWidth = 1.0
        payTypeField.keyboardType = .numberPad
        payTypeField.font = UIFont.systemFont(ofSize: 16)
        payTypeField.placeholder = "Mandatory"
        payTypeField.text = "100"
        subView.addSubview(payTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: payTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "payType", value: payTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .payFee, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class CoinMarketPriceView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var coinTypeField = UITextField()
    var currencyTypeField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 120, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let coinTypeLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 120, height: 30))
        coinTypeLb.font = UIFont.systemFont(ofSize: 16)
        coinTypeLb.text = "CoinTypeLb :"
        subView.addSubview(coinTypeLb)
        
        let coinPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        coinTypeField = UITextField(frame: CGRect(x: coinTypeLb.frame.maxX, y: coinTypeLb.frame.minY, width: 120, height: 30))
        coinTypeField.delegate = self
        coinTypeField.leftView = coinPadingView
        coinTypeField.rightView = coinPadingView
        coinTypeField.leftViewMode = .always
        coinTypeField.rightViewMode = .always
        coinTypeField.inputAccessoryView = toolBar
        coinTypeField.layer.masksToBounds = true
        coinTypeField.layer.borderColor = UIColor.black.cgColor
        coinTypeField.layer.borderWidth = 1.0
        coinTypeField.keyboardType = .numberPad
        coinTypeField.font = UIFont.systemFont(ofSize: 16)
        coinTypeField.placeholder = "Mandatory"
        coinTypeField.text = "100"
        subView.addSubview(coinTypeField)
        
        let currencyTypeLb = UILabel(frame: CGRect(x: 4, y: coinTypeLb.frame.maxY+4, width: 120, height: 30))
        currencyTypeLb.font = UIFont.systemFont(ofSize: 16)
        currencyTypeLb.text = "CurrencyType :"
        subView.addSubview(currencyTypeLb)
        
        let cPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        currencyTypeField = UITextField(frame: CGRect(x: currencyTypeLb.frame.maxX, y: currencyTypeLb.frame.minY, width: 120, height: 30))
        currencyTypeField.delegate = self
        currencyTypeField.leftView = cPadingView
        currencyTypeField.rightView = cPadingView
        currencyTypeField.leftViewMode = .always
        currencyTypeField.rightViewMode = .always
        currencyTypeField.inputAccessoryView = toolBar
        currencyTypeField.layer.masksToBounds = true
        currencyTypeField.layer.borderColor = UIColor.black.cgColor
        currencyTypeField.layer.borderWidth = 1.0
        currencyTypeField.keyboardType = .numberPad
        currencyTypeField.font = UIFont.systemFont(ofSize: 16)
        currencyTypeField.placeholder = "Mandatory"
        currencyTypeField.text = "100"
        subView.addSubview(currencyTypeField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: currencyTypeLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "coinType", value: coinTypeField.text!)
        parameter.add(key: "targetCurrencyType", value: currencyTypeField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .marketPrice, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class PaymentView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var currencyCdField = UITextField()
    var amountField = UITextField()
    var feeField = UITextField()
    var procSpeedField = UITextField()
    var walletAddrField = UITextField()
    var rewardListLb = UILabel()
    var calcTargetIDField = UITextField()
    var rewardMemoField = UITextField()
    var memoField = UITextField()
    
    var rewardList = Array<Any>()
    
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 130, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let currencyCdLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 130, height: 30))
        currencyCdLb.font = UIFont.systemFont(ofSize: 16)
        currencyCdLb.text = "CurrencyCode :"
        subView.addSubview(currencyCdLb)
        
        let cPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        currencyCdField = UITextField(frame: CGRect(x: currencyCdLb.frame.maxX, y: currencyCdLb.frame.minY, width: 120, height: 30))
        currencyCdField.delegate = self
        currencyCdField.leftView = cPadingView
        currencyCdField.rightView = cPadingView
        currencyCdField.leftViewMode = .always
        currencyCdField.rightViewMode = .always
        currencyCdField.inputAccessoryView = toolBar
        currencyCdField.layer.masksToBounds = true
        currencyCdField.layer.borderColor = UIColor.black.cgColor
        currencyCdField.layer.borderWidth = 1.0
        currencyCdField.keyboardType = .numberPad
        currencyCdField.font = UIFont.systemFont(ofSize: 16)
        currencyCdField.placeholder = "Mandatory"
        currencyCdField.text = "100"
        subView.addSubview(currencyCdField)
        
        let amountLb = UILabel(frame: CGRect(x: 4, y: currencyCdLb.frame.maxY+4, width: 130, height: 30))
        amountLb.font = UIFont.systemFont(ofSize: 16)
        amountLb.text = "Amount :"
        subView.addSubview(amountLb)
        
        let aPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        amountField = UITextField(frame: CGRect(x: amountLb.frame.maxX, y: amountLb.frame.minY, width: 120, height: 30))
        amountField.delegate = self
        amountField.leftView = aPadingView
        amountField.rightView = aPadingView
        amountField.leftViewMode = .always
        amountField.rightViewMode = .always
        amountField.inputAccessoryView = toolBar
        amountField.layer.masksToBounds = true
        amountField.layer.borderColor = UIColor.black.cgColor
        amountField.layer.borderWidth = 1.0
        amountField.keyboardType = .numberPad
        amountField.font = UIFont.systemFont(ofSize: 16)
        amountField.placeholder = "Mandatory"
        amountField.text = "7000"
        subView.addSubview(amountField)
        
        let feeLb = UILabel(frame: CGRect(x: 4, y: amountLb.frame.maxY+4, width: 130, height: 30))
        feeLb.font = UIFont.systemFont(ofSize: 16)
        feeLb.text = "Fee :"
        subView.addSubview(feeLb)
        
        let feePadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        feeField = UITextField(frame: CGRect(x: feeLb.frame.maxX, y: feeLb.frame.minY, width: 120, height: 30))
        feeField.delegate = self
        feeField.leftView = feePadingView
        feeField.rightView = feePadingView
        feeField.leftViewMode = .always
        feeField.rightViewMode = .always
        feeField.inputAccessoryView = toolBar
        feeField.layer.masksToBounds = true
        feeField.layer.borderColor = UIColor.black.cgColor
        feeField.layer.borderWidth = 1.0
        feeField.keyboardType = .numberPad
        feeField.font = UIFont.systemFont(ofSize: 16)
        feeField.placeholder = "Mandatory"
        feeField.text = "200"
        subView.addSubview(feeField)
        
        let procSpeedLb = UILabel(frame: CGRect(x: 4, y: feeLb.frame.maxY+4, width: 130, height: 30))
        procSpeedLb.font = UIFont.systemFont(ofSize: 16)
        procSpeedLb.text = "ProcSpeed :"
        subView.addSubview(procSpeedLb)
        
        let pPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        procSpeedField = UITextField(frame: CGRect(x: procSpeedLb.frame.maxX, y: procSpeedLb.frame.minY, width: 120, height: 30))
        procSpeedField.delegate = self
        procSpeedField.leftView = pPadingView
        procSpeedField.rightView = pPadingView
        procSpeedField.leftViewMode = .always
        procSpeedField.rightViewMode = .always
        procSpeedField.inputAccessoryView = toolBar
        procSpeedField.layer.masksToBounds = true
        procSpeedField.layer.borderColor = UIColor.black.cgColor
        procSpeedField.layer.borderWidth = 1.0
        procSpeedField.keyboardType = .numberPad
        procSpeedField.font = UIFont.systemFont(ofSize: 16)
        procSpeedField.placeholder = "Mandatory"
        procSpeedField.text = "200"
        subView.addSubview(procSpeedField)
        
        let walletAddrLb = UILabel(frame: CGRect(x: 4, y: procSpeedLb.frame.maxY+4, width: 130, height: 30))
        walletAddrLb.font = UIFont.systemFont(ofSize: 16)
        walletAddrLb.text = "WalletAddr :"
        subView.addSubview(walletAddrLb)
        
        let wPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        walletAddrField = UITextField(frame: CGRect(x: walletAddrLb.frame.maxX, y: walletAddrLb.frame.minY, width: 160, height: 30))
        walletAddrField.delegate = self
        walletAddrField.leftView = wPadingView
        walletAddrField.rightView = wPadingView
        walletAddrField.leftViewMode = .always
        walletAddrField.rightViewMode = .always
        walletAddrField.layer.masksToBounds = true
        walletAddrField.layer.borderColor = UIColor.black.cgColor
        walletAddrField.layer.borderWidth = 1.0
        walletAddrField.font = UIFont.systemFont(ofSize: 16)
        walletAddrField.placeholder = "Mandatory"
        walletAddrField.text = "0x9f89as9hfds8asdf"
        subView.addSubview(walletAddrField)
        
        rewardListLb = UILabel(frame: CGRect(x: 4, y: walletAddrLb.frame.maxY+4, width: 200, height: 30))
        rewardListLb.font = UIFont.systemFont(ofSize: 16)
        rewardListLb.text = "RewardList (Count:\(rewardList.count))"
        subView.addSubview(rewardListLb)
        
        let calcTargetLb = UILabel(frame: CGRect(x: 24, y: rewardListLb.frame.maxY+4, width: 130, height: 30))
        calcTargetLb.font = UIFont.systemFont(ofSize: 16)
        calcTargetLb.text = "CalcTargetID :"
        subView.addSubview(calcTargetLb)
        
        let calcPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        calcTargetIDField = UITextField(frame: CGRect(x: calcTargetLb.frame.maxX, y: calcTargetLb.frame.minY, width: 120, height: 30))
        calcTargetIDField.delegate = self
        calcTargetIDField.leftView = calcPadingView
        calcTargetIDField.rightView = calcPadingView
        calcTargetIDField.leftViewMode = .always
        calcTargetIDField.rightViewMode = .always
        calcTargetIDField.inputAccessoryView = toolBar
        calcTargetIDField.layer.masksToBounds = true
        calcTargetIDField.layer.borderColor = UIColor.black.cgColor
        calcTargetIDField.layer.borderWidth = 1.0
        calcTargetIDField.keyboardType = .numberPad
        calcTargetIDField.font = UIFont.systemFont(ofSize: 16)
        calcTargetIDField.placeholder = "Optional"
        calcTargetIDField.text = "1"
        subView.addSubview(calcTargetIDField)
        
        let rewardMemoLb = UILabel(frame: CGRect(x: 24, y: calcTargetLb.frame.maxY+4, width: 130, height: 30))
        rewardMemoLb.font = UIFont.systemFont(ofSize: 16)
        rewardMemoLb.text = "RewardMemo"
        subView.addSubview(rewardMemoLb)
        
        let rmPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        rewardMemoField = UITextField(frame: CGRect(x: rewardMemoLb.frame.maxX, y: rewardMemoLb.frame.minY, width: 150, height: 30))
        rewardMemoField.delegate = self
        rewardMemoField.leftView = rmPadingView
        rewardMemoField.rightView = rmPadingView
        rewardMemoField.leftViewMode = .always
        rewardMemoField.rightViewMode = .always
        rewardMemoField.layer.masksToBounds = true
        rewardMemoField.layer.borderColor = UIColor.black.cgColor
        rewardMemoField.layer.borderWidth = 1.0
        rewardMemoField.font = UIFont.systemFont(ofSize: 16)
        rewardMemoField.placeholder = "Optional"
        rewardMemoField.text = "blah blah~ blah blah......"
        subView.addSubview(rewardMemoField)
        
        let rewardButton = UIButton(frame: CGRect(x: 10, y: rewardMemoLb.frame.maxY+4, width: 200, height: 30))
        rewardButton.backgroundColor = UIColor.blue
        rewardButton.layer.cornerRadius = 10
        rewardButton.layer.borderWidth = 1
        rewardButton.layer.borderColor = UIColor.blue.cgColor
        rewardButton.setTitle("Add Reward", for: .normal)
        rewardButton.addTarget(self, action: #selector(rewardAction), for: .touchUpInside)
        subView.addSubview(rewardButton)
        
        let memoLb = UILabel(frame: CGRect(x: 4, y: rewardButton.frame.maxY+4, width: 130, height: 30))
        memoLb.font = UIFont.systemFont(ofSize: 16)
        memoLb.text = "Memo :"
        subView.addSubview(memoLb)
        
        let mPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        memoField = UITextField(frame: CGRect(x: memoLb.frame.maxX, y: memoLb.frame.minY, width: 150, height: 30))
        memoField.delegate = self
        memoField.leftView = mPadingView
        memoField.rightView = mPadingView
        memoField.leftViewMode = .always
        memoField.rightViewMode = .always
        memoField.layer.masksToBounds = true
        memoField.layer.borderColor = UIColor.black.cgColor
        memoField.layer.borderWidth = 1.0
        memoField.font = UIFont.systemFont(ofSize: 16)
        memoField.placeholder = "Optional"
        subView.addSubview(memoField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: memoLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func rewardAction () {
        
        let reward = ["rewardCalcTargetRangeId":calcTargetIDField.text,
                      "rewardMemo":rewardMemoField.text]
        
        rewardList.append(reward);
        
        calcTargetIDField.text = ""
        rewardMemoField.text = ""
        
        rewardListLb.text = "RewardList (Count:\(rewardList.count))"
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        let amount = Int(amountField.text!)
        let fee = Int(feeField.text!)
        
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "payCurrencyCd", value: currencyCdField.text!)
        parameter.add(key: "payAmount", value: NSNumber(integerLiteral: amount!))
        parameter.add(key: "payFee", value: NSNumber(integerLiteral: fee!))
        parameter.add(key: "payProcSpeed", value: procSpeedField.text!)
        parameter.add(key: "payWalletAddr", value: walletAddrField.text!)
        parameter.add(key: "rewardList", value: rewardList)
        parameter.add(key: "payMemo", value: memoField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .pay, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
            
            self.rewardList.removeAll()
            self.rewardListLb.text = "RewardList (Count:\(self.rewardList.count))"
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class RewardView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var walletAddrField = UITextField()
    var rewardListLb = UILabel()
    var calcTargetIDField = UITextField()
    var rewardMemoField = UITextField()
    
    var rewardList = Array<Any>()
    
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 150, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let walletAddrLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 150, height: 30))
        walletAddrLb.font = UIFont.systemFont(ofSize: 16)
        walletAddrLb.text = "ReceiveWalletAddr :"
        subView.addSubview(walletAddrLb)
        
        let wPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        walletAddrField = UITextField(frame: CGRect(x: walletAddrLb.frame.maxX, y: walletAddrLb.frame.minY, width: 160, height: 30))
        walletAddrField.delegate = self
        walletAddrField.leftView = wPadingView
        walletAddrField.rightView = wPadingView
        walletAddrField.leftViewMode = .always
        walletAddrField.rightViewMode = .always
        walletAddrField.layer.masksToBounds = true
        walletAddrField.layer.borderColor = UIColor.black.cgColor
        walletAddrField.layer.borderWidth = 1.0
        walletAddrField.font = UIFont.systemFont(ofSize: 16)
        walletAddrField.placeholder = "Mandatory"
        walletAddrField.text = "100"
        subView.addSubview(walletAddrField)
        
        rewardListLb = UILabel(frame: CGRect(x: 4, y: walletAddrLb.frame.maxY+4, width: 200, height: 30))
        rewardListLb.font = UIFont.systemFont(ofSize: 16)
        rewardListLb.text = "RewardList (Count:\(rewardList.count))"
        subView.addSubview(rewardListLb)
        
        let calcTargetLb = UILabel(frame: CGRect(x: 24, y: rewardListLb.frame.maxY+4, width: 130, height: 30))
        calcTargetLb.font = UIFont.systemFont(ofSize: 16)
        calcTargetLb.text = "CalcTargetID :"
        subView.addSubview(calcTargetLb)
        
        let calcPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        calcTargetIDField = UITextField(frame: CGRect(x: calcTargetLb.frame.maxX, y: calcTargetLb.frame.minY, width: 120, height: 30))
        calcTargetIDField.delegate = self
        calcTargetIDField.leftView = calcPadingView
        calcTargetIDField.rightView = calcPadingView
        calcTargetIDField.leftViewMode = .always
        calcTargetIDField.rightViewMode = .always
        calcTargetIDField.inputAccessoryView = toolBar
        calcTargetIDField.layer.masksToBounds = true
        calcTargetIDField.layer.borderColor = UIColor.black.cgColor
        calcTargetIDField.layer.borderWidth = 1.0
        calcTargetIDField.keyboardType = .numberPad
        calcTargetIDField.font = UIFont.systemFont(ofSize: 16)
        calcTargetIDField.placeholder = "Mandatory"
        calcTargetIDField.text = "1"
        subView.addSubview(calcTargetIDField)
        
        let rewardMemoLb = UILabel(frame: CGRect(x: 24, y: calcTargetLb.frame.maxY+4, width: 130, height: 30))
        rewardMemoLb.font = UIFont.systemFont(ofSize: 16)
        rewardMemoLb.text = "RewardMemo"
        subView.addSubview(rewardMemoLb)
        
        let rmPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        rewardMemoField = UITextField(frame: CGRect(x: rewardMemoLb.frame.maxX, y: rewardMemoLb.frame.minY, width: 150, height: 30))
        rewardMemoField.delegate = self
        rewardMemoField.leftView = rmPadingView
        rewardMemoField.rightView = rmPadingView
        rewardMemoField.leftViewMode = .always
        rewardMemoField.rightViewMode = .always
        rewardMemoField.layer.masksToBounds = true
        rewardMemoField.layer.borderColor = UIColor.black.cgColor
        rewardMemoField.layer.borderWidth = 1.0
        rewardMemoField.font = UIFont.systemFont(ofSize: 16)
        rewardMemoField.placeholder = "Optional"
        rewardMemoField.text = "blah blah~ blah blah......"
        subView.addSubview(rewardMemoField)
        
        let rewardButton = UIButton(frame: CGRect(x: 10, y: rewardMemoLb.frame.maxY+4, width: 200, height: 30))
        rewardButton.backgroundColor = UIColor.blue
        rewardButton.layer.cornerRadius = 10
        rewardButton.layer.borderWidth = 1
        rewardButton.layer.borderColor = UIColor.blue.cgColor
        rewardButton.setTitle("Add Reward", for: .normal)
        rewardButton.addTarget(self, action: #selector(rewardAction), for: .touchUpInside)
        subView.addSubview(rewardButton)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: rewardButton.frame.maxY+16, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func rewardAction () {
        
        let reward = ["rewardCalcTargetRangeId":calcTargetIDField.text,
                      "rewardMemo":rewardMemoField.text]
        
        rewardList.append(reward);
        
        calcTargetIDField.text = ""
        rewardMemoField.text = ""
        
        rewardListLb.text = "RewardList (Count:\(rewardList.count))"
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "rewardReceiveWalletAddr", value: walletAddrField.text!)
        parameter.add(key: "rewardList", value: rewardList)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .reward, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
            
            self.rewardList.removeAll()
            self.rewardListLb.text = "RewardList (Count:\(self.rewardList.count))"
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class PayCancelView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var transactionIdField = UITextField()
    var cancelAmountField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 130, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let transactionIdLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 130, height: 30))
        transactionIdLb.font = UIFont.systemFont(ofSize: 16)
        transactionIdLb.text = "TransactionId :"
        subView.addSubview(transactionIdLb)
        
        let tPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        transactionIdField = UITextField(frame: CGRect(x: transactionIdLb.frame.maxX, y: transactionIdLb.frame.minY, width: 140, height: 30))
        transactionIdField.delegate = self
        transactionIdField.leftView = tPadingView
        transactionIdField.rightView = tPadingView
        transactionIdField.leftViewMode = .always
        transactionIdField.rightViewMode = .always
        transactionIdField.inputAccessoryView = toolBar
        transactionIdField.layer.masksToBounds = true
        transactionIdField.layer.borderColor = UIColor.black.cgColor
        transactionIdField.layer.borderWidth = 1.0
        transactionIdField.keyboardType = .numberPad
        transactionIdField.font = UIFont.systemFont(ofSize: 16)
        transactionIdField.placeholder = "Mandatory"
        transactionIdField.text = "201856169518"
        subView.addSubview(transactionIdField)
        
        let cancelAmountLb = UILabel(frame: CGRect(x: 4, y: transactionIdLb.frame.maxY+4, width: 130, height: 30))
        cancelAmountLb.font = UIFont.systemFont(ofSize: 16)
        cancelAmountLb.text = "CancelAmount :"
        subView.addSubview(cancelAmountLb)
        
        let cPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        cancelAmountField = UITextField(frame: CGRect(x: cancelAmountLb.frame.maxX, y: cancelAmountLb.frame.minY, width: 120, height: 30))
        cancelAmountField.delegate = self
        cancelAmountField.leftView = cPadingView
        cancelAmountField.rightView = cPadingView
        cancelAmountField.leftViewMode = .always
        cancelAmountField.rightViewMode = .always
        cancelAmountField.inputAccessoryView = toolBar
        cancelAmountField.layer.masksToBounds = true
        cancelAmountField.layer.borderColor = UIColor.black.cgColor
        cancelAmountField.layer.borderWidth = 1.0
        cancelAmountField.keyboardType = .numberPad
        cancelAmountField.font = UIFont.systemFont(ofSize: 16)
        cancelAmountField.placeholder = "Mandatory"
        cancelAmountField.text = "7000"
        subView.addSubview(cancelAmountField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: cancelAmountLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        let cancelAmount = Int(cancelAmountField.text!)
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "payTransactionId", value: transactionIdField.text!)
        parameter.add(key: "payCancelAmount", value: NSNumber(integerLiteral: cancelAmount!))
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .payCancel, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

class RewardCancelView : UIView, UITextFieldDelegate {
    
    var franchiseIdField = UITextField()
    var rewardTransactionIdField = UITextField()
    var responsView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(subView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(doneAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let franchiseIdLb = UILabel(frame: CGRect(x: 4, y: 4, width: 130, height: 30))
        franchiseIdLb.font = UIFont.systemFont(ofSize: 16)
        franchiseIdLb.text = "FranchiseId :"
        subView.addSubview(franchiseIdLb)
        
        let fPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        franchiseIdField = UITextField(frame: CGRect(x: franchiseIdLb.frame.maxX, y: franchiseIdLb.frame.minY, width: 120, height: 30))
        franchiseIdField.delegate = self
        franchiseIdField.leftView = fPadingView
        franchiseIdField.rightView = fPadingView
        franchiseIdField.leftViewMode = .always
        franchiseIdField.rightViewMode = .always
        franchiseIdField.layer.masksToBounds = true
        franchiseIdField.layer.borderColor = UIColor.black.cgColor
        franchiseIdField.layer.borderWidth = 1.0
        franchiseIdField.font = UIFont.systemFont(ofSize: 16)
        franchiseIdField.placeholder = "Mandatory"
        franchiseIdField.text = "Franchise01"
        subView.addSubview(franchiseIdField)
        
        let transactionIdLb = UILabel(frame: CGRect(x: 4, y: franchiseIdLb.frame.maxY+4, width: 130, height: 30))
        transactionIdLb.font = UIFont.systemFont(ofSize: 16)
        transactionIdLb.text = "TransactionId :"
        subView.addSubview(transactionIdLb)
        
        let rPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        rewardTransactionIdField = UITextField(frame: CGRect(x: transactionIdLb.frame.maxX, y: transactionIdLb.frame.minY, width: 140, height: 30))
        rewardTransactionIdField.delegate = self
        rewardTransactionIdField.leftView = rPadingView
        rewardTransactionIdField.rightView = rPadingView
        rewardTransactionIdField.leftViewMode = .always
        rewardTransactionIdField.rightViewMode = .always
        rewardTransactionIdField.inputAccessoryView = toolBar
        rewardTransactionIdField.layer.masksToBounds = true
        rewardTransactionIdField.layer.borderColor = UIColor.black.cgColor
        rewardTransactionIdField.layer.borderWidth = 1.0
        rewardTransactionIdField.keyboardType = .numberPad
        rewardTransactionIdField.font = UIFont.systemFont(ofSize: 16)
        rewardTransactionIdField.placeholder = "Mandatory"
        rewardTransactionIdField.text = "201856169518"
        subView.addSubview(rewardTransactionIdField)
        
        let requestButton = UIButton(frame: CGRect(x: 10, y: transactionIdLb.frame.maxY+4, width: 200, height: 30))
        requestButton.backgroundColor = UIColor.blue
        requestButton.layer.cornerRadius = 10
        requestButton.layer.borderWidth = 1
        requestButton.layer.borderColor = UIColor.blue.cgColor
        requestButton.setTitle("Request ", for: .normal)
        requestButton.addTarget(self, action: #selector(requestAction), for: .touchUpInside)
        subView.addSubview(requestButton)
        
        let responseLabel = UILabel(frame:CGRect(x: 4, y: requestButton.frame.maxY+6, width: 140, height: 30))
        responseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        responseLabel.text = "Response Body"
        subView.addSubview(responseLabel)
        
        responsView = UITextView(frame: CGRect(x: 4, y: responseLabel.frame.maxY+2, width: subView.frame.width-8, height: subView.frame.height-responseLabel.frame.maxY-8))
        responsView.isEditable = false
        responsView.layer.masksToBounds = true
        responsView.layer.cornerRadius = 5
        responsView.layer.borderWidth = 1
        responsView.layer.borderColor = UIColor.red.cgColor
        subView.addSubview(responsView)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.endEditing(true)
        return true
    }
    
    @objc func doneAction(_ sender: Any)  {
        
        self.endEditing(true)
    }
    
    @objc public func requestAction () {
        
        self.endEditing(true)
        
        self.responsView.text = ""
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "franchiseId", value: franchiseIdField.text!)
        parameter.add(key: "rewardTransactionId", value: rewardTransactionIdField.text!)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .rewardCancel, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    if rsltTp == "R1000" {
                        self.responsView.text = dic.description
                    }
                    else {
                        self.responsView.text = dic.description
                    }
                }
                else {
                    self.responsView.text = dic.description
                }
            }
            else {
                self.responsView.text = error?.localizedDescription
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}
