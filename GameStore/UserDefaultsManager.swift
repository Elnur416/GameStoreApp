//
//  UserDefaultsManager.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import Foundation

class UserDefaultsManager {
    enum UserDefaultsTypes: String {
        case isLoggedIn = "LoggedIn"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
