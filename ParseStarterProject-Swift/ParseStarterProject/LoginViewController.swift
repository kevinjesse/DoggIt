//
//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Kevin Jesse on 1/7/16.
//  Copyright © 2016 Parse. All rights reserved.
//


import Parse
import ParseUI
import Foundation
import UIKit

class LoginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let loginViewController = PFLogInViewController()
    var backgroundImage : UIImageView!;
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil) {
            //delegate login controller
            loginViewController.delegate = self
            
            //set up login controller buttons
            loginViewController.fields = [.UsernameAndPassword , .LogInButton, .PasswordForgotten, .SignUpButton,  .Facebook, .Twitter]
            loginViewController.logInView?.logo = customizeTitle()
            loginViewController.logInView?.emailAsUsername = true
            loginViewController.signUpController?.emailAsUsername = true
            loginViewController.logInView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.logInView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            customizeButton(loginViewController.logInView?.signUpButton!)
            customizeButton(loginViewController.logInView?.logInButton!)
            
            //set up sign up controller buttons
            loginViewController.signUpController?.signUpView?.logo = customizeTitle()
            loginViewController.signUpController?.signUpView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.signUpController?.signUpView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.signUpController?.signUpView?.dismissButton!.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
            customizeButton(loginViewController.signUpController?.signUpView?.signUpButton!)
            
            //background image
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "bg.png")?.drawInRect(self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            loginViewController.logInView!.backgroundColor = UIColor(patternImage: image)
            loginViewController.signUpController?.signUpView!.backgroundColor = UIColor(patternImage: image)
            
            //set signup delegate
            loginViewController.signUpController?.delegate = self
            
            //set modal transitions
            self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            loginViewController.signUpController?.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            activityIndicator.startAnimating()
            var admin = false
            let query = PFQuery(className: "_User")
            query.whereKey("objectId", equalTo: (PFUser.currentUser()?.objectId)!)
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            admin = (object["admin"] as! Bool?)!
                        }
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        if (admin) {
                            self.performSegueWithIdentifier("goAdmin", sender: self)
                        }else {
                            self.performSegueWithIdentifier("goHome", sender: self)
                        }
                        self.activityIndicator.stopAnimating()
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
            
            
            
            
            
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print("successful login")
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser){
        print("successful signup")
        
        //        user["admin"] = false
        //        user.saveInBackgroundWithBlock() {
        //            (success: Bool, error: NSError?) -> Void in
        //            if (success) {
        //                print("successfully set admin")
        //            }else {
        //                print("failed to update admin")
        //            }
        //        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func customizeButton(button: UIButton!) {
        button.setBackgroundImage(nil, forState: .Normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func customizeTitle(_: Void) -> UILabel {
        let logo = UILabel()
        logo.text = "Quilts For You"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "billabong", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        return logo
    }
}
