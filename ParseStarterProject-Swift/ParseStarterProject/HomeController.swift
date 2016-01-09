//
//  ViewController.swift
//  FacebookTutorial
//


import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("goLogin", sender: self)
    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        self.performSegueWithIdentifier("goLogin", sender: self)
    }
}

