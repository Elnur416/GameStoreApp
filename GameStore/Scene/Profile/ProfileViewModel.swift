//
//  ProfileViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 13.01.25.
//

import Foundation

class ProfileViewModel {
    private let adapter = FileManagerHelper()
    private let adapterGame = FileManagerForCart()
    var games = [GameForCart]()
    var users = [User]()
    let manager = UserDefaultsManager()
    
    func readGameData() {
        adapterGame.readData(fileName: .collection) { data in
            self.games = data
        }
    }
    
    func readUserData() {
        adapter.readData { data in
            self.users = data
        }
    }
}
