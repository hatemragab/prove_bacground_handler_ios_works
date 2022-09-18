//
//  AppDelegate.swift
//  test_notif
//
//  Created by Hatem Ragap on 16/09/2022.
//

import UIKit
import Firebase
import FirebaseMessaging
import FirebaseCore
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.sound,.badge]){
            success,_ in
            guard success else{
                return
            }
            print("success in apns registry")
        }
     
        application.registerForRemoteNotifications()
    
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print(fcmToken!)
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        print("didReceiveRemoteNotificationdidReceiveRemoteNotification HEllo")
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Hi"
        content.body = "body here"
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "testx", content: content, trigger: trigger)
        center.add(request){
            (error) in
            if error != nil {
                print(error)
            }
        }
        //should call this after finsih your task to stop the instance
        completionHandler(.newData)
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
       // print(userInfo)
           // print("didReceiveRemoteNotificationdidReceiveRemoteNotification HEllo")
    }
}

