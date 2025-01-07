//
//  RegisterViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import Foundation

class RegisterViewModel {
    let manager = UserDefaultsManager()
    private let adapter = FileManagerHelper()
    private var users = [User]()
    var error: (() -> Void)?
    
    func readData() {
        adapter.readData { data in
            self.users = data
        }
    }
    
    func writeData(user: User) {
        if users.contains(where: { $0.fullname == user.fullname && $0.phone == user.phone && $0.email == user.email && $0.password == user.password}) {
            error?()
        } else {
            adapter.writeData(user: users)
        }
    }
}
