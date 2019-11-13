//
//  Add Contact VC.swift
//  Channelier new
//
//  Created by Himanshu Jha on 10/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class Add_Contact_VC: UIViewController {

    
    @IBAction func backBtn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var topView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label:UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 150, height: 30))
                label.text = "Channelier"
                label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                label.font = UIFont.systemFont(ofSize: 22.0)
                self.view.addSubview(label)
                
                topView.layer.shadowColor = UIColor.black.cgColor
                topView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
                topView.layer.shadowOpacity = 0.6
                topView.layer.shadowRadius = 4.0

        // Do any additional setup after loading the view.
    }

}
