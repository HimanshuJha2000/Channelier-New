//
//  ContactsVC.swift
//  Channelier new
//
//  Created by Himanshu Jha on 09/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {

    @IBAction func backBtn(_ sender: UIButton) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        guard let HomeViewController = storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
        HomeViewController.modalPresentationStyle = .overCurrentContext
        present(HomeViewController, animated: false)
    }
    
    @IBAction func addContactBtn(_ sender: UIButton) {
//        Add_Contact_VC
        guard let Add_Contact_VC = storyboard?.instantiateViewController(identifier: "Add_Contact_VC") as? Add_Contact_VC else { return }
        Add_Contact_VC.modalPresentationStyle = .fullScreen
        present(Add_Contact_VC, animated: true)
        
    }
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var contactsSubLabel: UILabel!
    
    override func viewDidLoad() {
        
//      contactsSubLabel.shadowOffset = CGSize(width: 0, height: 1.0)
//        contactsSubLabel.shadowOpacity = 0.2
//        contactsSubLabel.shadowRadius = 4.0
        let label:UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 150, height: 30))
                label.text = "Contacts"
                label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                label.font = UIFont.systemFont(ofSize: 22.0)
                self.view.addSubview(label)
        
//        topView.layer.backgroundColor = UIColor.clear.cgColor
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 4.0
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
