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

import Foundation

func customizeButton(button: UIButton!) {
    button.setBackgroundImage(nil, forState: .Normal)
    button.backgroundColor = UIColor.clearColor()
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.whiteColor().CGColor
}


class LoginViewController : PFLogInViewController, PFLogInViewControllerDelegate {
    
    var backgroundImage : UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        logInView!.insertSubview(backgroundImage, atIndex: 0)
        
        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Quilts For You"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "billabong", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        logInView?.logo = logo

        self.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
        self.emailAsUsername = true
        self.logInView?.facebookButton?.addTarget(self, action: "_loginWithFacebook", forControlEvents: .TouchUpInside);
        self.logInView?.twitterButton?.addTarget(self, action: "_loginWithTwitter", forControlEvents: .TouchUpInside)
        
        customizeButton(logInView?.signUpButton!)
        customizeButton(logInView?.logInButton!)
        
        logInView?.logInButton?.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 0.5)
        logInView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        logInView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        logInView?.signUpButton?.backgroundColor = UIColor(white: 1, alpha: 0.5)
        logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)

        // use our custom SignUpViewController
        self.signUpController = SignUpViewController()
        self.signUpController?.delegate = SignUpViewController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRectMake( 0,  0,  logInView!.frame.width,  logInView!.frame.height)
        
        // position logo at top with larger frame
        logInView!.logo!.sizeToFit()
        let logoFrame = logInView!.logo!.frame
        logInView!.logo!.frame = CGRectMake(logoFrame.origin.x, logInView!.usernameField!.frame.origin.y - logoFrame.height - 40, logInView!.frame.width,  logoFrame.height)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(PFUser.currentUser()?.username)
        if (PFUser.currentUser()?.username != nil) {
            self.performSegueWithIdentifier("loginSuccess", sender: self)
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print("successful login")
    }

    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser){
        print("successful login")
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}


class SignUpViewController : PFSignUpViewController, PFSignUpViewControllerDelegate{
    
    var backgroundImage : UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        signUpView!.insertSubview(backgroundImage, atIndex: 0)
        
        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Quilts For You"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "billabong", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        signUpView?.logo = logo

        // change dismiss button to say 'Already signed up?'
        signUpView?.dismissButton!.setTitle("Already signed up?", forState: .Normal)
        signUpView?.dismissButton!.setImage(nil, forState: .Normal)
        
        self.emailAsUsername = true
        signUpView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        signUpView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        customizeButton(signUpView?.signUpButton!)
        signUpView?.signUpButton!.backgroundColor = UIColor(red: 1/255, green: 159/255, blue: 233/255, alpha: 0.5)
    
        // modify the present tranisition to be a flip instead
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRectMake( 0,  0,  signUpView!.frame.width,  signUpView!.frame.height)
        
        // position logo at top with larger frame
        signUpView!.logo!.sizeToFit()
        let logoFrame = signUpView!.logo!.frame
        signUpView!.logo!.frame = CGRectMake(logoFrame.origin.x, signUpView!.usernameField!.frame.origin.y - logoFrame.height - 40, signUpView!.frame.width,  logoFrame.height)
        
        // re-layout out dismiss button to be below sign
        let dismissButtonFrame = signUpView!.dismissButton!.frame
        signUpView?.dismissButton!.frame = CGRectMake(0, signUpView!.signUpButton!.frame.origin.y + signUpView!.signUpButton!.frame.height + 40.0,  signUpView!.frame.width,  dismissButtonFrame.height)
    }
    
//    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        print("successful login")
//    }
//    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser){
        print("successful login")
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}