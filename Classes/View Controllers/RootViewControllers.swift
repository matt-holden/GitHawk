//
//  RootViewControllers.swift
//  Freetime
//
//  Created by Ryan Nystrom on 5/17/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit

func newSettingsRootViewController(
    sessionManager: GithubSessionManager,
    rootNavigationManager: RootNavigationManager
    ) -> UIViewController {
    guard let controller = UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController()
        else { fatalError("Could not unpack settings storyboard") }

    if let nav = controller as? UINavigationController,
        let first = nav.viewControllers.first as? SettingsViewController {
        first.sessionManager = sessionManager
        first.rootNavigationManager = rootNavigationManager
        nav.tabBarItem.title = NSLocalizedString("Settings", comment: "")
        nav.tabBarItem.image = UIImage(named: "tab-gear")
        nav.tabBarItem.selectedImage = UIImage(named: "tab-gear-selected")
    }

    return controller
}

func newNotificationsRootViewController(client: GithubClient) -> UIViewController {
    let controller = NotificationsViewController(client: client)
    let title = NSLocalizedString("Inbox", comment: "")
    controller.navigationItem.title = title
    controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    let nav = UINavigationController(rootViewController: controller)
    nav.tabBarItem.title = title
    nav.tabBarItem.image = UIImage(named: "tab-inbox")
    nav.tabBarItem.selectedImage = UIImage(named: "tab-inbox-selected")
    return nav
}

func newSearchRootViewController(client: GithubClient) -> UIViewController {
    let controller = SearchViewController(client: client)
    let nav = UINavigationController(rootViewController: controller)
    nav.tabBarItem.title = NSLocalizedString("Search", comment: "")
    nav.tabBarItem.image = UIImage(named: "tab-search")
    nav.tabBarItem.selectedImage = UIImage(named: "tab-search-selected")
    return nav
}
