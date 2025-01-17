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
            users.append(user)
            guard let index = users.firstIndex(where: { $0.email == user.email && $0.password == user.password }) else { return }
            manager.setValue(value: index, key: .getUserIndex)
            adapter.writeData(user: users)
        }
    }
}
