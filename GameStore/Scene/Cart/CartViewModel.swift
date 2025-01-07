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
      
    func readData() {
        adapter.readData { data in
            self.games = data
        }
    }
}
