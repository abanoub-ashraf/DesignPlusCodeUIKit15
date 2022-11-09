//
//  SceneDelegate.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 01/11/2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        ///
        /// if no signed in user then login
        ///
        if Auth.auth().currentUser == nil {
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        } else {
            ///
            /// initial controlelr is the one that has arrow attacched to it in storyboard
            ///
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? CustomTabBarController
        }
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }

}
