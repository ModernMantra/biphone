//
//  AppDelegate.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 15/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var providerDelegate: CallKitProviderDelegate?
    var sipConnection: SIPConnectvity?
    static var shared: AppDelegate!

    override init() {
        super.init()
        AppDelegate.shared = self
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.sipConnection = SIPConnectvity()
        self.setupCallKit()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    
    fileprivate func setupCallKit() {
        providerDelegate = CallKitProviderDelegate(callManager: VialerSIPLib.sharedInstance().callManager)
    }
    
}
