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
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword , .LogInButton, .PasswordForgotten, .SignUpButton,  .Facebook, .Twitter]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController = SignUpViewController()
            
            let logo = UILabel()
            logo.text = "Quilts For You"
            logo.textColor = UIColor.whiteColor()
            logo.font = UIFont(name: "billabong", size: 70)
            logo.shadowColor = UIColor.lightGrayColor()
            logo.shadowOffset = CGSizeMake(2, 2)
            
            loginViewController.logInView?.logo = logo
            loginViewController.logInView?.emailAsUsername = true
            
            customizeButton(loginViewController.logInView?.signUpButton!)
            customizeButton(loginViewController.logInView?.logInButton!)
            
            loginViewController.logInView?.logInButton?.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 0.5)
            loginViewController.logInView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.logInView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
            loginViewController.logInView?.signUpButton?.backgroundColor = UIColor(white: 1, alpha: 0.5)
            loginViewController.logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            //background image
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "bg.png")?.drawInRect(self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            loginViewController.logInView!.backgroundColor = UIColor(patternImage: image)
            
            self.presentViewController(loginViewController, animated: false, completion: nil)
        } else {
            //presentLoggedInAlert()
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("successful login")
        //presentLoggedInAlert()
    }

    func presentLoggedInAlert() {
        //print("done")
    }
}

func customizeButton(button: UIButton!) {
    button.setBackgroundImage(nil, forState: .Normal)
    button.backgroundColor = UIColor.clearColor()
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.whiteColor().CGColor
}

class SignUpViewController : PFSignUpViewController, PFSignUpViewControllerDelegate{
    
    //let SignUpViewController = PFSignUpViewController()
    var backgroundImage : UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView?.delegate = self
        
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "bg"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        signUpView!.insertSubview(backgroundImage, atIndex: 0)

        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Quilts For Kevin"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "billabong", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        self.signUpView?.logo = logo
        
        // change dismiss button to say 'Already signed up?'
        self.signUpView?.dismissButton!.setTitle("Already signed up?", forState: .Normal)
        signUpView?.dismissButton!.setImage(nil, forState: .Normal)
        
        self.emailAsUsername = true
        self.signUpView?.usernameField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        self.signUpView?.passwordField?.backgroundColor = UIColor(white: 1, alpha: 0.8)
        customizeButton(signUpView?.signUpButton!)
        self.signUpView?.signUpButton!.backgroundColor = UIColor(red: 1/255, green: 159/255, blue: 233/255, alpha: 0.5)
        
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRectMake( 0,  0,  signUpView!.frame.width,  signUpView!.frame.height)
        
        // position logo at top with larger frame
        signUpView!.logo!.sizeToFit()
        let logoFrame = signUpView!.logo!.frame
        signUpView!.logo!.frame = CGRectMake(logoFrame.origin.x, signUpView!.usernameField!.frame.origin.y - logoFrame.height - 16, signUpView!.frame.width,  logoFrame.height)
        
        // re-layout out dismiss button to be below sign
        let dismissButtonFrame = signUpView!.dismissButton!.frame
        signUpView?.dismissButton!.frame = CGRectMake(0, signUpView!.signUpButton!.frame.origin.y + signUpView!.signUpButton!.frame.height + 16.0,  signUpView!.frame.width,  dismissButtonFrame.height)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser){
        print("successful signup")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}