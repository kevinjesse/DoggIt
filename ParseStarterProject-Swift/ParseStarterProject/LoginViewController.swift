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
            
//            loginViewController.signUpController?.signUpView?.dismissButton!.setTitle("Already signed up?", forState: .Normal)
//            loginViewController.signUpController?.signUpView?.dismissButton!.setImage(nil, forState: .Normal)
//            let dismissButtonFrame = loginViewController.signUpController?.signUpView!.dismissButton!.frame
//            loginViewController.signUpController?.signUpView?.dismissButton!.frame = CGRectMake(0, (loginViewController.signUpController?.signUpView!.signUpButton!.frame.origin.y)! + (loginViewController.signUpController?.signUpView!.signUpButton!.frame.height)! + 16.0,  (loginViewController.signUpController?.signUpView!.frame.width)!,  dismissButtonFrame!.height)
            
            //finally present the controller
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            //debug
            print("segue to home")
            self.performSegueWithIdentifier("loginSuccess", sender: self)
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print("successful login")
        //self.performSegueWithIdentifier("loginSuccess", sender: self)
        self.dismissViewControllerAnimated(false, completion: nil)
        
        //presentLoggedInAlert()
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser){
        print("successful signup")
        //self.performSegueWithIdentifier("loginSuccess", sender: self)
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func customizeButton(button: UIButton!) {
        button.setBackgroundImage(nil, forState: .Normal)
        //button.backgroundColor = UIColor.clearColor()
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
