//
//  ViewController.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 15/12/2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties -
    
    fileprivate lazy var phoneViewController: PhoneViewController = {
        let viewController = PhoneViewController(nibName: String(describing: PhoneViewController.self), bundle: nil)
        
        viewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tab_bar_phone")!,
            selectedImage: UIImage(named: "tab_bar_phone")!
        )
        viewController.tabBarItem.tag = 1
        
        return viewController
    }()
    
    fileprivate lazy var settingsViewController: SettingsViewController = {
        let viewController = SettingsViewController(nibName: String(describing: SettingsViewController.self), bundle: nil)
        
        viewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tab_bar_settings")!,
            selectedImage: UIImage(named: "tab_bar_settings")!
        )
        viewController.tabBarItem.tag = 2
        
        return viewController
    }()
    
    fileprivate lazy var historyViewController: CallHistoryViewController = {
        let viewController = CallHistoryViewController(nibName: String(describing: CallHistoryViewController.self), bundle: nil)
        
        viewController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "tab_bar_history")!,
            selectedImage: UIImage(named: "tab_bar_history")!
        )
        viewController.tabBarItem.tag = 3
        
        return viewController
    }()
    
    fileprivate var viewcontrollers: [UIViewController]?

    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabBarViewControllers()
        
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(directlyShowActiveCallController(_:)),
                                               name: Notification.Name.CallKitProviderDelegateOutboundCallStarted,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(directlyShowActiveCallController(_:)),
                                               name: Notification.Name.CallKitProviderDelegateInboundCallAccepted,
                                               object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addTabBarViewControllers() {
        var viewControllersList = [UIViewController]()
        
        viewControllersList.append(self.phoneViewController)
        viewControllersList.append(self.historyViewController)
        viewControllersList.append(self.settingsViewController)
        
        self.viewControllers = viewControllersList
        self.viewControllers = viewControllersList.map { UINavigationController(rootViewController: $0) }
        self.viewcontrollers = viewControllersList
    }
    
    @objc func directlyShowActiveCallController(_ notification: Notification) {
        guard let call = notification.userInfo?[VSLNotificationUserInfoCallKey] as? VSLCall else { return }
        print("........ Incommming Call ..........")
    }
    
}
