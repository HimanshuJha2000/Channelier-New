//
//  HomeViewController.swift
//  Channelier new
//
//  Created by Himanshu Jha on 02/11/19.
//  Copyright © 2019 Himanshu Jha. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    func performAnimation(transition: CATransition){
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
    }
    @IBOutlet weak var salesBtn: UIButton!
    @IBOutlet weak var purchasesBtn: UIButton!

    let transition = SlideInTransition()
    
    @IBOutlet weak var topView: UIView!
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let menuViewController = mainstoryboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
                menuViewController.modalPresentationStyle = .overCurrentContext
                
                menuViewController.didTapMenuType = { menuType in
                     self.transitionToNew(menuType)
                }
                menuViewController.transitioningDelegate = self
                present(menuViewController, animated: true)
    }
    
    @IBAction func salesBtnAction(_ sender: UIButton) {
        topView.backgroundColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.8470588235, alpha: 1)
    }

    @IBAction func purchasesBtnAction(_ sender: UIButton) {
        topView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.8470588235, alpha: 1)
        print("this class called")
        // Do any additional setup after loading the view.
    }
    
    func transitionToNew(_ menuType: MenuType) {
//        let title = String(describing: menuType).capitalized
//        self.title = title
        topView?.removeFromSuperview()
        switch menuType {
        case .home:
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
            
        case .contacts:
            let transition: CATransition = CATransition()
            performAnimation(transition: transition)
            self.view.window!.layer.add(transition, forKey: nil)
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)

        case .feeds:
            let transition: CATransition = CATransition()
            performAnimation(transition: transition)
            self.view.window!.layer.add(transition, forKey: nil)
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "FeedsViewController") as! FeedsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
            
        case .settings:
            let transition: CATransition = CATransition()
            performAnimation(transition: transition)
            self.view.window!.layer.add(transition, forKey: nil)
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
            
        case .profile:
            let transition: CATransition = CATransition()
            performAnimation(transition: transition)
            self.view.window!.layer.add(transition, forKey: nil)
            let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = mainstoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
            
            
        default:
            break
        }
    }
    
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

