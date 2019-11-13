//
//  FeedsViewController.swift
//  Channelier new
//
//  Created by Himanshu Jha on 09/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController {
    
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label:UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 150, height: 30))
        label.text = "Feeds"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.view.addSubview(label)
        
    }

}


