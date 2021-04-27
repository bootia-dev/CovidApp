//
//  NavigationController.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

class NavigationController: UINavigationController {
    
    var statusBarStyle: UIStatusBarStyle = App.shared.statusBarStyle {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    var transluscent: Bool = false {
        didSet {
            navigationBar.isTranslucent = transluscent
            
            if transluscent {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.shadowImage = UIImage()
                view.backgroundColor = .clear
            }
        }
    }
    
    private var shadowLine: UIView = UIView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.NavigationBar.title,
            NSAttributedString.Key.font: UIFont.NavigationBar.title
        ]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    func showShadow() {
        addCustomBottomLine(color: UIColor.NavigationBar.shadow, height: 0.5)
    }
    
    func hideShadow() {
        for view in navigationBar.subviews {
            if view == shadowLine {
                shadowLine.removeFromSuperview()
            }
        }
    }
    
    func addCustomBottomLine(color: UIColor, height: Double) {
        //Hiding Default Line and Shadow
        navigationBar.setValue(true, forKey: "hidesShadow")

        for view in navigationBar.subviews {
            if view == shadowLine {
                return
            }
        }
        
        //Creating New line
        shadowLine = UIView(frame: CGRect(x: 0, y: 0, width:0, height: height))
        shadowLine.backgroundColor = color
        navigationBar.addSubview(shadowLine)

        shadowLine.translatesAutoresizingMaskIntoConstraints = false
        shadowLine.widthAnchor.constraint(equalTo: navigationBar.widthAnchor).isActive = true
        shadowLine.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        shadowLine.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        shadowLine.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
    }
}
