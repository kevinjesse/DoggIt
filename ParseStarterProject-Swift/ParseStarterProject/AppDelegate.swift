//
//  AppDelegate.swift
//  FacebookTutorial
//
//  Created by Brian Coleman on 2015-03-27.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit
import Parse

import ParseFacebookUtilsV4
import ParseTwitterUtils

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.enableLocalDatastore()
       // let defaultACL = PFACL();
        // If you would like all objects to be private by default, remove this line.
//        defaultACL.publicReadAccess = true
//        
//        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser:true)
        
        if application.applicationState != UIApplicationState.Background {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
            
            let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
            var noPushPayload = false;
            if let options = launchOptions {
                noPushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil;
            }
            if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
            }
        }

        
        Parse.setApplicationId("Z74UstNz9MKBVGwGlxHceu4AjVcsIvZVQu5SUObt", clientKey:"rC23AgPbmtDAAtj6fdlY3kRegGjNR10wQLADOfUq")
            PFTwitterUtils.initializeWithConsumerKey("pLHBW3n5vXw5aSHN6OZkKlvx8", consumerSecret:"qwgRXe4zDW9nwx7fEKBTvolrsGR4zImcFG3ZbXRuHp8VeuQEU1")
                PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions);
                return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    
    
}


//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//    
//    var window: UIWindow?
//    
//    
//    
//
//    
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        
//        // Enable storing and querying data from Local Datastore.
//        // Remove this line if you don't want to use Local Datastore features or want to use cachePolicy.
//        Parse.enableLocalDatastore()
//
//        // Uncomment and fill in with your Parse credentials:
//        Parse.setApplicationId("Z74UstNz9MKBVGwGlxHceu4AjVcsIvZVQu5SUObt", clientKey: "rC23AgPbmtDAAtj6fdlY3kRegGjNR10wQLADOfUq")
//
//        
//        PFUser.enableAutomaticUser()
//        
//        let defaultACL = PFACL();
//        
//        // If you would like all objects to be private by default, remove this line.
//        defaultACL.publicReadAccess = true
//        
//        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser:true)
//        
//        if application.applicationState != UIApplicationState.Background {
//            // Track an app open here if we launch with a push, unless
//            // "content_available" was used to trigger a background push (introduced in iOS 7).
//            // In that case, we skip tracking here to avoid double counting the app-open.
//            
//            let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
//            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
//            var noPushPayload = false;
//            if let options = launchOptions {
//                noPushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil;
//            }
//            if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
//                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
//            }
//        }
//        
//        // Override point for customization after application launch.
//        //return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
//        return true;
//    }

//    func application(application: UIApplication,
//        openURL url: NSURL,
//        sourceApplication: String?,
//        annotation: AnyObject) -> Bool {
//            return FBSDKApplicationDelegate.sharedInstance().application(
//                application,
//                openURL: url,
//                sourceApplication: sourceApplication,
//                annotation: annotation)
//    }
//    
//    func applicationWillResignActive(application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    }
//    
//
//    
//    func applicationDidEnterBackground(application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//    
//    func applicationWillEnterForeground(application: UIApplication) {
//        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    }
//    
//    func applicationDidBecomeActive(application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//        FBSDKAppEvents.activateApp()
//    }
//    
//    func applicationWillTerminate(application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
    
    //--------------------------------------
    // MARK: Push Notifications
    //--------------------------------------
    
//    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
//        let installation = PFInstallation.currentInstallation()
//        installation.setDeviceTokenFromData(deviceToken)
//        installation.saveInBackground()
//        
//        PFPush.subscribeToChannelInBackground("") { (succeeded: Bool, error: NSError?) in
//            if succeeded {
//                print("ParseStarterProject successfully subscribed to push notifications on the broadcast channel.\n");
//            } else {
//                print("ParseStarterProject failed to subscribe to push notifications on the broadcast channel with error = %@.\n", error)
//            }
//        }
//    }
//    
//    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
//        if error.code == 3010 {
//            print("Push notifications are not supported in the iOS Simulator.\n")
//        } else {
//            print("application:didFailToRegisterForRemoteNotificationsWithError: %@\n", error)
//        }
//    }
//    
//    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
//        PFPush.handlePush(userInfo)
//        if application.applicationState == UIApplicationState.Inactive {
//            PFAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
//        }
//    }
    
//}

