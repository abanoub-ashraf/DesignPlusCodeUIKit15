//
//  AppDelegate.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 01/11/2022.
//

import UIKit
import FirebaseCore
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        ///
        /// register for notifications
        ///
        UNUserNotificationCenter.current().delegate = self
        
        ///
        /// request permission for allow notifications
        ///
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { granted, error in
            guard error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }
            
            print("Alow Notifications Permission granted")
        }
        
        ///
        /// to be able to receive and interact with the upcoming notifications from firebase
        ///
        Messaging.messaging().delegate = self
        
        ///
        /// registers to receive remote notifications through Apple Push Notification service
        ///
        application.registerForRemoteNotifications()
        
        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }

}

///
/// for interacting with the notif
///
extension AppDelegate: UNUserNotificationCenterDelegate {
    ///
    /// allows us to do any work right when the notification is about to be presented
    ///
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .badge, .banner])
    }
    
    ///
    /// allows us to do any work after the notification is received
    ///
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    ///
    /// - this tells that the app did register for apple push notifications service
    /// - this tell the messaging which device to send notification to
    ///
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
}

///
/// A protocol to handle token update or data message delivery from FCM
///
extension AppDelegate: MessagingDelegate {
    
}
