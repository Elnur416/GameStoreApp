//
//  WishListViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 07.01.25.
//

import Foundation

class WishListViewModel {
    let adapter = FileManagerForCart()
    var games = [GameForCart]()
    
    func readData() {
        adapter.readData(fileName: .wishlist) { data in
            self.games = data
        }
    }
}
