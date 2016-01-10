//
//  ViewController.swift
//  FacebookTutorial
//


import UIKit
import Parse
class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser()?.username == nil) {
            self.performSegueWithIdentifier("goLogin", sender: self)
        }

        //self.performSegueWithIdentifier("goLogin", sender: self)
    }
    
    @IBAction func logoutTapped(sender: AnyObject) {
        PFUser.logOut()
        print(PFUser.currentUser()?.username)
        self.performSegueWithIdentifier("goLogin", sender: self)
    }
//    @IBAction func logoutTapped(sender: UIButton) {
//        PFUser.logOut()
//        print(PFUser.currentUser()?.username)
//        //self.performSegueWithIdentifier("logoutSuccess", sender: self)
//    }
}

