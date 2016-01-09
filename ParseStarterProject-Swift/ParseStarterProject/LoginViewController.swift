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

class LoginViewController : PFLogInViewController {
    
    var backgroundImage : UIImageView!;
    
    var viewsToAnimate: [UIView!]!;
    
    var viewsFinalYPosition : [CGFloat]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "signup"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        logInView!.insertSubview(backgroundImage, atIndex: 0)
        
        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Kevin's App"
        logo.textColor = UIColor.whiteColor()
        logo.font = UIFont(name: "billabong", size: 70)
        logo.shadowColor = UIColor.lightGrayColor()
        logo.shadowOffset = CGSizeMake(2, 2)
        logInView?.logo = logo
        
        self.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]

        // set forgotten password button to white
        logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        // make the background of the login button pop more
//        logInView?.logInButton?.setBackgroundImage(nil, forState: .Normal)
//        logInView?.logInButton?.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 1)
//        
//        // make the buttons classier
//        customizeButton(logInView?.facebookButton!)
//        customizeButton(logInView?.twitterButton!)
//        customizeButton(logInView?.signUpButton!)
//        
//        // create an array of all the views we want to animate in when we launch
//        // the screen
//        viewsToAnimate = [self.logInView?.usernameField, self.logInView?.passwordField, self.logInView?.logInButton, self.logInView?.passwordForgottenButton, self.logInView?.facebookButton, self.logInView?.twitterButton, self.logInView?.signUpButton, self.logInView?.logo]
//        
        // use our custom SignUpViewController
        //self.signUpController = SignUpViewController()
    }
    
    func customizeButton(button: UIButton!) {
        button.setBackgroundImage(nil, forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRectMake( 0,  0,  logInView!.frame.width,  logInView!.frame.height)
        
        // position logo at top with larger frame
        logInView!.logo!.sizeToFit()
        let logoFrame = logInView!.logo!.frame
        logInView!.logo!.frame = CGRectMake(logoFrame.origin.x, logInView!.usernameField!.frame.origin.y - logoFrame.height - 16, logInView!.frame.width,  logoFrame.height)
        
        // We to position all the views off the bottom of the screen
        // and then make them rise back to where they should be
        // so we track their final position in an array
        // but change their frame so they are shifted downwards off the screen
//        viewsFinalYPosition = [CGFloat]();
//        for viewToAnimate in viewsToAnimate {
//            let currentFrame = viewToAnimate.frame
//            viewsFinalYPosition.append(currentFrame.origin.y)
//            viewToAnimate.frame = CGRectMake(currentFrame.origin.x, self.view.frame.height + currentFrame.origin.y, currentFrame.width, currentFrame.height)
//        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Now we'll animate all our views back into view
        // so they are no longer transparent (alpha = 1)
        // and, using the final position we stored, we'll
        // reset them to where they should be
//        if viewsFinalYPosition.count == self.viewsToAnimate.count {
//            UIView.animateWithDuration(1, delay: 0.0, options: .CurveEaseInOut,  animations: { () -> Void in
//                for viewToAnimate in self.viewsToAnimate {
//                    //viewToAnimate.alpha = 1
//                    let currentFrame = viewToAnimate.frame
//                    viewToAnimate.frame = CGRectMake(currentFrame.origin.x, self.viewsFinalYPosition.removeAtIndex(0), currentFrame.width, currentFrame.height)
//                }
//                }, completion: nil)
//        }
    }
    
}




//class LoginViewController: PFLogInViewController, PFLogInViewControllerDelegate {
//    var backgroundImage : UIImageView!;
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        if (PFUser.currentUser() == nil) {
//            let loginViewController = PFLogInViewController()
//            loginViewController.delegate = self
//            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
//            loginViewController.emailAsUsername = true
//            
//            let logo = UILabel()
//            logo.text = "Quilts For You"
//            logo.textColor = UIColor.whiteColor()
//            logo.font = UIFont(name: "billabong", size: 70)
//            logo.shadowColor = UIColor.lightGrayColor()
//            logo.shadowOffset = CGSizeMake(2, 2)
//            logInView?.logo = logo
//
//            self.presentViewController(loginViewController, animated: false, completion: nil)
//            
//
//        } else {
//            presentLoggedInAlert()
//        }
//    }
//    
//    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        presentLoggedInAlert()
//    }
//    
//    func presentLoggedInAlert() {
////        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Vay.K", preferredStyle: .Alert)
////        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
////            self.dismissViewControllerAnimated(true, completion: nil)
////        }
////        alertController.addAction(OKAction)
////        self.presentViewController(alertController, animated: true, completion: nil)
//    }
//}


//with picture
//class LoginViewController: PFLogInViewController, PFLogInViewControllerDelegate{
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//    
//    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        presentLoggedInAlert()
//    }
//    
//    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        presentLoggedInAlert()
//    }
//    
//    func presentLoggedInAlert() {
////        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Vay.K", preferredStyle: .Alert)
////        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
////            self.dismissViewControllerAnimated(true, completion: nil)
////        }
////        alertController.addAction(OKAction)
////        self.presentViewController(alertController, animated: true, completion: nil)
//    }
//    
//    var backgroundImage : UIImageView!;
//    //    var viewsToAnimate: [UIView!]!;
//    //    var viewsFinalYPosition : [CGFloat]!;
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        if (PFUser.currentUser() == nil) {
////            let loginViewController = PFLogInViewController()
////            loginViewController.delegate = self
////            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook, .Twitter]
////            loginViewController.emailAsUsername = true
////            
////            self.presentViewController(loginViewController, animated: false, completion: nil)
////        } else {
////            presentLoggedInAlert()
////        }
//
//        
//        // set our custom background image
//        backgroundImage = UIImageView(image: UIImage(named: "signup"))
//        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
//        logInView!.insertSubview(backgroundImage, atIndex: 0)
//        
//        
//        //        // remove the parse Logo
//        let logo = UILabel()
//        logo.text = "Quilts For You"
//        logo.textColor = UIColor.whiteColor()
//        logo.font = UIFont(name: "billabong", size: 70)
//        logo.shadowColor = UIColor.lightGrayColor()
//        logo.shadowOffset = CGSizeMake(2, 2)
//        logInView?.logo = logo
//        
//        // set forgotten password button to white
//        logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        
//        // make the background of the login button pop more
//        logInView?.logInButton?.setBackgroundImage(nil, forState: .Normal)
//        logInView?.logInButton?.backgroundColor = UIColor.clearColor()
//        logInView?.logInButton?.layer.borderWidth = 1
//        logInView?.logInButton?.layer.cornerRadius = 5
//        logInView?.logInButton?.layer.borderColor = UIColor.whiteColor().CGColor
//        
//        // make the buttons classier
//        //        customizeButton(logInView?.facebookButton!)
//        //        customizeButton(logInView?.twitterButton!)
//        //        customizeButton(logInView?.signUpButton!)
//        
//        // create an array of all the views we want to animate in when we launch
//        // the screen
//        //        viewsToAnimate = [self.logInView?.usernameField, self.logInView?.passwordField, self.logInView?.logInButton, self.logInView?.passwordForgottenButton, self.logInView?.facebookButton, self.logInView?.twitterButton, self.logInView?.signUpButton, self.logInView?.logo]
//        
//    }
//    
//    func customizeButton(button: UIButton!) {
//        button.setBackgroundImage(nil, forState: .Normal)
//        button.backgroundColor = UIColor.clearColor()
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.whiteColor().CGColor
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        // stretch background image to fill screen
//        backgroundImage.frame = CGRectMake( 0,  0,  logInView!.frame.width,  logInView!.frame.height)
//        
//        // position logo at top with larger frame
//        logInView!.logo!.sizeToFit()
//        let logoFrame = logInView!.logo!.frame
//        logInView!.logo!.frame = CGRectMake(logoFrame.origin.x, logInView!.usernameField!.frame.origin.y - logoFrame.height - 16, logInView!.frame.width,  logoFrame.height)
//        
//        // We to position all the views off the bottom of the screen
//        // and then make them rise back to where they should be
//        // so we track their final position in an array
//        // but change their frame so they are shifted downwards off the screen
//        //        viewsFinalYPosition = [CGFloat]();
//        //        for viewToAnimate in viewsToAnimate {
//        //            let currentFrame = viewToAnimate.frame
//        //            viewsFinalYPosition.append(currentFrame.origin.y)
//        //            viewToAnimate.frame = CGRectMake(currentFrame.origin.x, self.view.frame.height + currentFrame.origin.y, currentFrame.width, currentFrame.height)
//        //        }
//    }
//
//}
//
//
//}
