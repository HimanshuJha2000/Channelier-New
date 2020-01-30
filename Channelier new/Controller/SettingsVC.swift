//
//  SettingsVC.swift
//  Channelier new
//
//  Created by Himanshu Jha on 09/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var beatManagement: UIButton!
    
    @IBOutlet weak var createLogFile: UIButton!
    
    @IBOutlet weak var Languages: UIButton!
    
    @IBOutlet weak var aboutUs: UIButton!
    
    @IBOutlet weak var logOut: UIButton!
    
    @IBAction func backBtn(_ sender: UIButton) {
        let transition: CATransition = CATransition()
                      transition.duration = 0.4
                      transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                      transition.type = CATransitionType.reveal
                      transition.subtype = CATransitionSubtype.fromRight
                      self.view.window!.layer.add(transition, forKey: nil)
                      let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                      let vc = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                      vc.modalPresentationStyle = .fullScreen
                      self.present(vc, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label:UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 150, height: 30))
        label.text = "Settings"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.view.addSubview(label)
        
        beatManagement.layer.borderWidth = 1.0
        beatManagement.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        
//        beatManagement.layer.shadowColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
//        beatManagement.layer.shadowOpacity = 0.8
//        beatManagement.layer.shadowRadius = 2
//        beatManagement.layer.shadowOffset = CGSize(width: 1, height: 1)

        createLogFile.layer.borderWidth = 1.0
        createLogFile.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)

        Languages.layer.borderWidth = 1.0
        Languages.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)

        aboutUs.layer.borderWidth = 1.0
        aboutUs.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)

        logOut.layer.borderWidth = 1.0
        logOut.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
