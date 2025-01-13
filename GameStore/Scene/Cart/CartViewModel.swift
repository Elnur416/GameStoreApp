//
//  CartViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 07.01.25.
//

import Foundation
import UIKit

class CartViewModel {
    let adapter = FileManagerForCart()
    var games = [GameForCart]()
    let manager = UserDefaultsManager()
    var gamesOnCollection = [GameForCart]()
    
    func readData() {
        adapter.readData(fileName: .cart) { data in
            self.games = data
        }
    }
    
    func writeData() {
        adapter.writeData(fileName: .cart, game: games)
    }
    
    func getTotalPrice() -> Double {
        let totalPrice = games.reduce(0) { $0 + ($1.price ?? 0.0) }
        return totalPrice
    }
    
    func readFromCollection() {
        adapter.readData(fileName: .collection) { data in
            self.gamesOnCollection = data
        }
    }
    
    func getCollection() {
        gamesOnCollection.append(contentsOf: games)
        adapter.writeData(fileName: .collection, game: gamesOnCollection)
    }
}
