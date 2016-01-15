//
//  ViewController.swift
//  FacebookTutorial
//


import UIKit
import Parse
class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var admin = false
//        let query = PFQuery(className: "_User")
//        query.whereKey("objectId", equalTo: (PFUser.currentUser()?.objectId)!)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            
//            if error == nil {
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        admin = (object["admin"] as! Bool?)!
//                    }
//                }
//                if (admin) {
//                    print("is admin")
//                    
//                    
//                }else {
//                    print("not admin")
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!.userInfo)")
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser()?.username == nil) {
            self.performSegueWithIdentifier("goLogin", sender: self)
        }else {
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
//                            if (admin) {
//                                self.performSegueWithIdentifier("goAdmin", sender: self)
//                            }else {
//                                self.performSegueWithIdentifier("goHome", sender: self)
//                            }
                            self.performSegueWithIdentifier("goHome", sender: self)
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }

        }

        //self.performSegueWithIdentifier("goLogin", sender: self)
    }
    

//    @IBAction func logoutTapped(sender: AnyObject) {
//        PFUser.logOut()
//        //print(PFUser.currentUser()?.username)
//        self.performSegueWithIdentifier("goLogin", sender: self)
//    }
//    @IBAction func logoutTapped(sender: UIButton) {
//        PFUser.logOut()
//        print(PFUser.currentUser()?.username)
//        //self.performSegueWithIdentifier("logoutSuccess", sender: self)
//    }
}


