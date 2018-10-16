//
//  ViewController.swift
//  FantomWalletSDK
//
//  Created by skaehdus on 10/16/2018.
//  Copyright (c) 2018 skaehdus. All rights reserved.
//

import UIKit
import FantomWalletSDK

class TextField: UITextField {
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return false
    }
}

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickOption = [["title":"=== select service ==="],
                      ["title":"IF-FTM-WL-002"],
                      ["title":"IF-FTM-WL-003"],
                      ["title":"IF-FTM-WL-004"],
                      ["title":"IF-FTM-WL-005"],
                      ["title":"IF-FTM-WL-006"],
                      ["title":"IF-FTM-WL-007"],
                      ["title":"IF-FTM-WL-008"],
                      ["title":"IF-FTM-WL-009"],
                      ["title":"IF-FTM-WL-010"],
                      ["title":"IF-FTM-WL-011"],
                      ["title":"IF-FTM-WL-012"],
                      ["title":"IF-FTM-WL-013"],
                      ["title":"IF-FTM-WL-014"]]
    
    var timer = Timer()
    
    
    var idTextField = UITextField()
    var pwTextField = UITextField()
    
    var pickerTextField = TextField()
    let pickerView = UIPickerView()
    var interfaceView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let authLabel = UILabel.init(frame:CGRect(x: 10, y: 50, width: 100, height: 30))
        authLabel.font = UIFont.boldSystemFont(ofSize: 17)
        authLabel.text = "Auth Client"
        self.view.addSubview(authLabel)
        
        let idPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        let pwPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        
        idTextField = UITextField(frame: CGRect(x: 10, y: 84, width: 280, height: 30))
        idTextField.delegate = self
        idTextField.leftView = idPadingView
        idTextField.rightView = idPadingView
        idTextField.leftViewMode = .always
        idTextField.rightViewMode = .always
        idTextField.layer.masksToBounds = true
        idTextField.layer.borderColor = UIColor.black.cgColor
        idTextField.layer.borderWidth = 1.0
        idTextField.font = UIFont.systemFont(ofSize: 16)
        idTextField.placeholder = "Client ID"
        idTextField.text = "client01"
        self.view.addSubview(idTextField)
        
        pwTextField = UITextField(frame: CGRect(x: 10, y: 118, width: 280, height: 30))
        pwTextField.delegate = self
        pwTextField.leftView = pwPadingView
        pwTextField.rightView = pwPadingView
        pwTextField.leftViewMode = .always
        pwTextField.rightViewMode = .always
        pwTextField.layer.masksToBounds = true
        pwTextField.layer.borderColor = UIColor.black.cgColor
        pwTextField.layer.borderWidth = 1.0
        pwTextField.font = UIFont.systemFont(ofSize: 16)
        pwTextField.placeholder = "Client Password"
        pwTextField.text = "asldkjfoiwefnonsdcf"
        self.view.addSubview(pwTextField)
        
        let authButton = UIButton(frame: CGRect(x: 10, y: 152, width: 280, height: 30))
        authButton.backgroundColor = UIColor.blue
        authButton.layer.cornerRadius = 10
        authButton.layer.borderWidth = 1
        authButton.layer.borderColor = UIColor.blue.cgColor
        authButton.setTitle("Authentication ", for: .normal)
        authButton.addTarget(self, action: #selector(authButtonAction), for: .touchUpInside)
        self.view.addSubview(authButton)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let serviceLabel = UILabel.init(frame:CGRect(x: 10, y: authButton.frame.maxY+10, width: 70, height: 30))
        serviceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        serviceLabel.text = "Service :"
        self.view.addSubview(serviceLabel)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(donePicker(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        pickerTextField = TextField(frame: CGRect(x: serviceLabel.frame.maxX, y: serviceLabel.frame.minY, width: 220, height: 30))
        pickerTextField.isUserInteractionEnabled = false
        pickerTextField.delegate = self
        pickerTextField.leftView = paddingView
        pickerTextField.rightView = paddingView
        pickerTextField.leftViewMode = .always
        pickerTextField.rightViewMode = .always
        pickerTextField.layer.masksToBounds = true
        pickerTextField.layer.borderColor = UIColor.black.cgColor
        pickerTextField.layer.cornerRadius = 5
        pickerTextField.layer.borderWidth = 1.0
        pickerTextField.text = "=== select service ==="
        pickerTextField.inputView = pickerView
        pickerTextField.inputAccessoryView = toolBar
        pickerTextField.textColor = UIColor.gray
        self.view.addSubview(pickerTextField)
        
        interfaceView  = UIScrollView(frame: CGRect(x: 10, y: serviceLabel.frame.maxY+4, width: self.view.frame.width-20, height: self.view.frame.height-serviceLabel.frame.maxY-34))
        interfaceView.layer.masksToBounds = true
        interfaceView.layer.borderColor = UIColor.black.cgColor
        interfaceView.layer.borderWidth = 1.0
        interfaceView.bounces = false
        self.view.addSubview(interfaceView)
    }
    
    @objc func authButtonAction() {
        
        interfaceView.subviews.forEach { $0.removeFromSuperview() }
        interfaceView.contentSize = interfaceView.frame.size
        
        pickerTextField.text = pickOption[0]["title"]
        pickerTextField.isUserInteractionEnabled = false
        pickerTextField.textColor = UIColor.gray
        
        FantomWallet.shared.setAcceseToken(tokenType: "", accessToken: "")
        
        let clientId:String = idTextField.text!
        let clientSecret:String = pwTextField.text!
        
        var parameter:Dictionary<String, Any> = Dictionary()
        parameter.add(key: "clientId", value: clientId)
        parameter.add(key: "clientPw", value: clientSecret)
        parameter.add(key: "reqDate", value: getCurrentDate())
        
        FantomWallet.shared.reqApi(interfaceType: .clientAuth, parameter: parameter.jsonString!)
        { (statusCode, resData, error) in
            
            if resData != nil {
                
                let dic = Dictionary<String, Any>().jsonToDic(jsonString: resData!)!
                
                if statusCode == 200 {
                    
                    let rsltTp:String = dic["rsltTp"] as! String
                    
                    //R000 : success
                    //R900 : fail
                    //R999 : etc
                    if rsltTp == "R1000" {
                        let tokenType:String = dic["tokenType"] as! String
                        let accessToken:String = dic["accessToken"] as! String
                        
                        FantomWallet.shared.setAcceseToken(tokenType: tokenType, accessToken: accessToken)
                        
                        self.pickerTextField.isUserInteractionEnabled = true
                        self.pickerTextField.textColor = UIColor.black
                    }
                    else {
                        let rsltDesc:String = dic["rsltDesc"] as! String
                        print("rsltDesc :\n\(rsltDesc)\n")
                    }
                }
                else {
                    print("resData :\n\(dic)\n")
                }
            }
            else {
                print("error :\n\(error.debugDescription)\n")
            }
        }
    }
    
    @objc func donePicker(_ sender: Any)  {
        
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        runTimer()
        
        return pickOption[row]["title"]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerTextField.text = pickOption[row]["title"]
        
        interfaceView.subviews.forEach { $0.removeFromSuperview() }
        interfaceView.contentSize = interfaceView.frame.size
        
        switch row {
        case 1:
            let subView = FranchiseListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 2:
            let subView = FranchiseInfoView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 3:
            let subView = FranchiseRewardPolicyListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 4:
            let subView = FranchisePenaltyPolicyListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 5:
            let subView = FranchiseRewardListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 6:
            let subView = FranchisePenaltyListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 7:
            let subView = FranchisePayListView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 8:
            let subView = FranchisePayFeeInfoView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 9:
            let subView = CoinMarketPriceView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 10:
            interfaceView.contentSize = CGSize(width: interfaceView.frame.width, height: 556.0)
            let subView = PaymentView.init(frame: CGRect(x: 0, y: 0, width: interfaceView.frame.width, height: 556.0))
            interfaceView.addSubview(subView)
        case 11:
            let subView = RewardView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 12:
            let subView = PayCancelView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        case 13:
            let subView = RewardCancelView.init(frame: interfaceView.bounds)
            interfaceView.addSubview(subView)
        default: break
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+9:00")
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
    
    @objc func runTime() {
        self.view.endEditing(true)
        
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    func runTimer() {
        
        if timer.isValid {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(runTime), userInfo: nil, repeats: false)
    }
    
    
}
