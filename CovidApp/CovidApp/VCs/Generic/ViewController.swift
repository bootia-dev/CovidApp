//
//  BaseViewController.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import AppTrackingTransparency
import UIKit

class ViewController: UIViewController {

    var navigationBarColor: UIColor? {
        didSet {
            navigationController?.navigationBar.barTintColor = navigationBarColor
        }
    }

    var navigationBarTransluscent: Bool = false {
        didSet {
            refreshNavigationBar()
        }
    }

    var screenTitle: String? {
        didSet {
            navigationItem.title = screenTitle
        }
    }

    var screenName = ""
    var showShadow = false
    var showBackButton = true
    var isVisible: Bool = false

    // MARK: - Status Bar methods
    var statusBarStyle: UIStatusBarStyle = App.shared.statusBarStyle {
        didSet {
            refreshStatusBar()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { (status) in }
        }

        navigationBarTransluscent = false
        overrideUserInterfaceStyle = .light
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navController = navigationController as? NavigationController,
            let top = navController.topViewController as? ViewController {

            navController.navigationBar.barTintColor = (top.navigationBarColor != nil) ? top.navigationBarColor : UIColor.NavigationBar.background

            if showShadow {
                navController.showShadow()
            } else {
                navController.hideShadow()
            }
        }
        
        refreshNavigationBar()
        refreshStatusBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        isVisible = true

        if screenName.isEmpty {
            print("WARNING Missing screen name for class \(String(describing: self))")
        } else {
            // FIXME: improve this
            navigationItem.accessibilityLabel = screenName
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        isVisible = false
    }

    func popToViewController(with className: String) {
        if let viewControllers = self.navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController.getClassName() == className.lowercased() {
                    self.navigationController?.popToViewController(viewController, animated: true)
                }
            }
        }
    }

    private func refreshNavigationBar() {
        if let navController = navigationController as? NavigationController {
            navController.transluscent = navigationBarTransluscent
        }
    }
    
    private func refreshStatusBar() {
        if let navController = navigationController as? NavigationController {
            navController.statusBarStyle = statusBarStyle
        } else {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
}
