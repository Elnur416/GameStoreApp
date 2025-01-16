//
//  LoginViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import Foundation

class LoginViewModel {
    let manager = UserDefaultsManager()
    private let adapter = FileManagerHelper()
    private var users = [User]()
    var error: (() -> Void)?
    var success: (() -> Void)?
    
    func readData() {
        adapter.readData { data in
            self.users = data
        }
    }
    
    func checkUser(email: String, password: String) {
        if users.contains(where: { $0.email == email && $0.password == password}) {
            guard let index = users.firstIndex(where: { $0.email == email && $0.password == password }) else { return }
            manager.setValue(value: index, key: .getUserIndex)
            success?()
        } else {
            error?()
        }
    }
}
