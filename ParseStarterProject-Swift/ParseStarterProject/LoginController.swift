//
//  Login.swift
//  ParseStarterProject-Swift
//
//  Created by Kevin Jesse on 1/6/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit
import ParseUI

import UIKit

extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        //imageViewBackground.image = UIImage(named: "signup.jpg")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
//
//class LoginController: PFSignUpViewController {
//    
//    var backgroundImage : UIImageView!;
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // set our custom background image
//        backgroundImage = UIImageView(image: UIImage(named: "welcome_bg"))
//        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
//        signUpView!.insertSubview(backgroundImage, atIndex: 0)
//        
//        // remove the parse Logo
//        let logo = UILabel()
//        logo.text = "Vay.K"
//        logo.textColor = UIColor.whiteColor()
//        logo.font = UIFont(name: "Pacifico", size: 70)
//        logo.shadowColor = UIColor.lightGrayColor()
//        logo.shadowOffset = CGSizeMake(2, 2)
//        signUpView?.logo = logo
//        
//        // make the background of the sign up button pop more
//        signUpView?.signUpButton!.setBackgroundImage(nil, forState: .Normal)
//        signUpView?.signUpButton!.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 1)
//        
//        // change dismiss button to say 'Already signed up?'
//        signUpView?.dismissButton!.setTitle("Already signed up?", forState: .Normal)
//        signUpView?.dismissButton!.setImage(nil, forState: .Normal)
//        
//        // modify the present tranisition to be a flip instead
//        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        // stretch background image to fill screen
//        backgroundImage.frame = CGRectMake( 0,  0,  signUpView!.frame.width,  signUpView!.frame.height)
//        
//        // position logo at top with larger frame
//        signUpView!.logo!.sizeToFit()
//        let logoFrame = signUpView!.logo!.frame
//        signUpView!.logo!.frame = CGRectMake(logoFrame.origin.x, signUpView!.usernameField!.frame.origin.y - logoFrame.height - 16, signUpView!.frame.width,  logoFrame.height)
//        
//        // re-layout out dismiss button to be below sign
//        let dismissButtonFrame = signUpView!.dismissButton!.frame
//        signUpView?.dismissButton!.frame = CGRectMake(0, signUpView!.signUpButton!.frame.origin.y + signUpView!.signUpButton!.frame.height + 16.0,  signUpView!.frame.width,  dismissButtonFrame.height)
//        
//    }
//    
//}

//class LoginController: UIViewController, FBSDKLoginButtonDelegate {
//   
//    @IBOutlet weak var email: UITextField!
//    @IBOutlet weak var password: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addBackground()
//        if (FBSDKAccessToken.currentAccessToken() != nil){
//            // User is already logged in, do work such as go to next view controller.
//            
//            // Or Show Logout Button
//            //            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            //            self.view.addSubview(loginView)
//            //            loginView.center = self.view.center
//            //            loginView.readPermissions = ["public_profile", "email", "user_friends"]
//            //            loginView.delegate = self
//            //self.returnUserData()
//        }else{
//            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginView)
//            loginView.center = self.view.center
//            loginView.readPermissions = ["public_profile", "email", "user_friends"]
//            loginView.delegate = self
//        }
//        
//    }
//
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(true)
//        
////        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
////        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
////        if (isLoggedIn != 1) {
////            self.performSegueWithIdentifier("goto_login", sender: self)
////        } else {
////            self.usernameLabel.text = prefs.valueForKey("USERNAME") as? String
////        }
//    }
//
//    
//    // Facebook Delegate Methods
//    
//    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
//        print("User Logged In")
//        if ((error) != nil){
//            // Process error
//        }else if result.isCancelled {
//            // Handle cancellations
//        }else {
//            // If you ask for multiple permissions at once, you
//            // should check if specific permissions missing
//            if result.grantedPermissions.contains("email"){
//            }
//            self.returnUserData()
//        }
//        
//    }
//    
//    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
//        print("User Logged Out")
//    }
//    
//    func returnUserData(){
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, name"])
//        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
//            
//            if ((error) != nil)
//            {
//                // Process error
//                print("Error: \(error)")
//            }
//            else
//            {
//                print("fetched user: \(result)")
//                let userName : NSString = result.valueForKey("email") as! NSString
//                print("User Name is: \(userName)")
//                let userEmail : NSString = result.valueForKey("email") as! NSString
//                let userPass : NSString = result.valueForKey("id") as! NSString
//                print("User Email is: \(userEmail)")
//                //self.checkUserParse(userEmail)
//                self.pushUserParse(userName, userEmail: userEmail, userPass: userPass)
//            }
//        })
//        
//    }
//    
//    //    func checkUserParse(userEmail:NSString!) {
//    //        let findUsers:PFQuery = PFUser.query()!;
//    //        findUsers.whereKey("email",  equalTo: userEmail)
//    //        if (findUsers.countObjects(<#T##error: NSErrorPointer##NSErrorPointer#>) > 0) {
//    //            return true
//    //        }
//    //    }
//    
//    func pushUserParse(userName:NSString!, userEmail:NSString!, userPass: NSString!) {
//        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
//        spinner.startAnimating()
//        
//        let newUser = PFUser()
//        newUser.username = userName as String?
//        newUser.email = userEmail as String?
//        newUser.password = userPass as String?
//        
//        newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
//            
//            // Stop the spinner
//            spinner.stopAnimating()
//            if ((error) != nil) {
//            } else {
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
//                    self.presentViewController(viewController, animated: true, completion: nil)
//                })
//            }
//        })
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//}
