//
//  AppDelegate.swift
//  WaitList
//
//  Created by Avie Desai on 2/2/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import Google


var locations = [String]()
var locationaddr = [String:String]()
var profilepics = [String:UIImage]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL!,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    override init() {
        super.init()
        FirebaseApp.configure()
    }
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let database = Database.database().reference()
        let storageref = Storage.storage().reference()
        
        database.child("Locations").observeSingleEvent(of: .value, with: { (snapshot) in
            locations.removeAll()
            for child in snapshot.children
            {
                let snap = child as! DataSnapshot
                let name = snap.key
                locations.append(name)
                locationaddr[name] = snap.value as? String
                let url = "LocationPics/" + name + ".jpg"
                let pic = storageref.child(url)
                pic.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                    if let error = error
                    {
                        print(error)
                    }
                    else
                    {
                    profilepics[name] = UIImage(data: data!)
                    }
                    
                }
            }
            
            
           
        })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

