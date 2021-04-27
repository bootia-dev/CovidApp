//
//  App.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

class App {
    static let shared = App()

    var token: String? {
        didSet {
            UserDefaults.standard.set(token, forKey: K.UserDefaultsKeys.token)
        }
    }

    var isLoggedIn: Bool { return token != nil }

    var deviceTokenData: Data? {
        didSet {
            guard let data = deviceTokenData else { return }
            UserDefaults.standard.set(data, forKey: K.UserDefaultsKeys.deviceTokenData)
        }
    }

    var statusBarStyle: UIStatusBarStyle = .lightContent

    private init() {
        token = UserDefaults.standard.string(forKey: K.UserDefaultsKeys.token)
        deviceTokenData = UserDefaults.standard.data(forKey: K.UserDefaultsKeys.deviceTokenData)
    }
}
