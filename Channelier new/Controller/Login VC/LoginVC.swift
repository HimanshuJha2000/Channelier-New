//
//  LoginVC.swift
//  Channelier new
//
//  Created by Himanshu Jha on 18/10/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit
import Foundation
import Toast_Swift

class LoginVC: UIViewController {
    
//    struct MyVariables {
//        static var yourVariable = "someString"
//    }
        
    @IBOutlet weak var emailUsernameTxtField: UITextField!
            
    @IBOutlet weak var passwordTxtField: UITextField!
            
    @IBOutlet weak var checkBoxBtn: UIButton!
            
    @IBOutlet weak var loginBtn: UIButton!
            
    var checkBoxNumber = 1
    var iconClick = true
    var emailID = "nil"
//    completion :(Bool, Int?, Error?)
    
    func openLink(urlString : String) {
        guard let url = URL(string: urlString) else {
          return //be safe
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        else {
            UIApplication.shared.openURL(url)
        }
    }
            
    @IBAction func privacyPolicy(_ sender: Any) {
        openLink(urlString: "https://beta.channelier.com/index.php?route=information/information/info&information_id=3")
    }
        
        
    @IBAction func registerBtn(_ sender: Any) {
        openLink(urlString: "https://beta.channelier.com/index.php?route=account/register")
        }
        
       
    @IBAction func checkBoxBtnAction(_ sender: UIButton) {
            UIView.animate(withDuration: 0.07, delay: 0.1, options: .curveLinear, animations: {
                      sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                      
                  }) { (success) in
                      UIView.animate(withDuration: 0.07, delay: 0.1, options: .curveLinear, animations: {
                          sender.isSelected = !sender.isSelected
                        
                        if sender.isSelected {
                            self.checkBoxNumber = 1
                            print(self.checkBoxNumber)
                        }
                            
                        else{
                            self.checkBoxNumber = 0
                            print(self.checkBoxNumber)
                        }
                        
                          sender.transform = .identity
                      }, completion: nil)
                  }
        }
   
    @IBAction func showPasswordBtnAction(_ sender: UIButton) {
        if(iconClick == true) {
            passwordTxtField.isSecureTextEntry = false
        } else {
            passwordTxtField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    
    @IBAction func forgotPswBtn(_ sender: Any) {
        print("Function called")
        let alert = UIAlertController(title: "Forgot Password", message: "Enter the e-mail or mobile number for your account. The password shall be mailed/messaged to you.", preferredStyle: .alert)
        alert.addTextField{ (tf) in tf.placeholder = "Email" }
        let submit = UIAlertAction(title: "Submit", style: .default)
        { (_) in guard let email = alert.textFields?.first?.text
            else { return }
            self.emailID = email
            print(self.emailID)
            
        if(self.emailID.isphoneNumber){
          var number = 1
          guard let url = URL(string: "https://beta.channelier.com/index.php?route=feed/rest_api_v2/forgotten&email=8287224594" )
          else { return  }
          let session = URLSession.shared
          session.dataTask(with: url) { (data, response, err) in

          if let data = data {
          do {
              let json = try JSONSerialization.jsonObject(with: data, options: [])
              if let dictionary = json as? [String: Any] {
              if let title = dictionary["success"] as? String {
                          number = 1
                          print("\(number) Error -> \(title)")
                      }
                                                                                 
              if let title = dictionary["error"] as? String {
                          number = 0
                          print("\(number) Error -> \(title)")
                      }
                  }
              }
          catch{
              print(error)
              }
          }
      }.resume()

                
    }
                
           
            
            
            
            else if(self.emailID.isValidEmail()){
                guard let url = URL(string: "https://beta.channelier.com/index.php?route=feed/rest_api_v2/forgotten&email="+self.emailID)
                    else { return }
                let session = URLSession.shared
                session.dataTask(with: url) { (data, response, err) in
                    if let response = response {
                        //print(response)
                    }
                    
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print(json)
//                            if let dictionary = json as? [String: Any] {
//
//                            if let title = dictionary["success"] as? String {
//                                self.view.makeToast("Success: A new password has been sent to your e-mail address")
//                                //self.view.makeToast(self.toastMsg)
//                                }
//                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }.resume()
                
                self.view.makeToast("Success: A new password has been sent to your e-mail address")
            }
            
                
            else if(self.emailID == "nil" || self.emailID == ""){
                self.view.makeToast("Invalid Email/Mobile")
            }
                
            else {
                self.view.makeToast("Invalid Email/Mobile")
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancel)
        alert.addAction(submit)
        present(alert, animated: true, completion: nil)
        
        }
        
        
    @IBAction func betaChannelierSite(_ sender: Any) {
           openLink(urlString: "https://beta.channelier.com/")
        }

       
    @IBAction func loginBtnAction(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier : "HomeViewController" )
            controller.modalPresentationStyle = .fullScreen
           // let navController = UINavigationController (rootViewController: controller)
            self.present(controller, animated: true, completion: nil)
            //self.navigationController?.navigationBar.isHidden = true
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            checkBoxBtn.layer.borderColor = UIColor.white.cgColor
            checkBoxBtn.layer.borderWidth = 1
            emailUsernameTxtField.layer.cornerRadius = 5
            passwordTxtField.layer.cornerRadius = 5
            
            loginBtn.layer.cornerRadius = 5
            emailUsernameTxtField.setLeftPaddingPoints(10)
            passwordTxtField.setLeftPaddingPoints(10)
            
//            checkBoxBtn.setImage(UIImage(named:"UncheckedBox"), for: .normal)
//            checkBoxBtn.setImage(UIImage(named:"CheckBox"), for: .selected)
            
        }

    }

    extension UITextField {
          func setLeftPaddingPoints(_ amount:CGFloat){
              let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
              self.leftView = paddingView
              self.leftViewMode = .always
          }
          func setRightPaddingPoints(_ amount:CGFloat) {
              let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
              self.rightView = paddingView
              self.rightViewMode = .always
          }
      }

    extension String {
        
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
        
        
    var isphoneNumber : Bool {
        do {
            let detector = try NSDataDetector(types:NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            }
            else {
                return false
            }
        }
        catch {
            return false
            }
        }
        
    }
    // for showing bottom border of UITextfield in swift
    //var bottomLine = CALayer()
    //bottomLine.frame = CGRectMake(0.0, myTextField.frame.height - 1, myTextField.frame.width, 1.0)
    //bottomLine.backgroundColor = UIColor.whiteColor().CGColor
    //myTextField.borderStyle = UITextBorderStyle.None
    //myTextField.layer.addSublayer(bottomLine)

    


//to handle response
//                    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                        self.view.makeToast("Invalid Email or Mobile")
//                        return
//                    }


//to resume after cmpletion of thread
//               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                   print(number)
//                   self.view.makeToast(MyVariables.yourVariable)
