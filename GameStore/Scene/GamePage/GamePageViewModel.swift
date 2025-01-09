//
//  GamePageViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 07.01.25.
//

import Foundation

class GamePageViewModel {
    var selectedGame: Game?
    var selectedGameFromCart: GameForCart?
    let managerGame = CoreDataForGame(context: AppDelegate().persistentContainer.viewContext)
    let adapter = FileManagerForCart()
    let adapterForWishlist = FileManagerForWishlist()
    var gamesForCart = [GameForCart]()
    var gamesForWishlist = [GameForCart]()
    var liked: Bool?
    
    func convertModel(game: Game) -> GameForCart {
        return GameForCart(
            name: game.name ?? "",
            mainImage: game.mainImage ?? "",
            customImage: game.customImage ?? "",
            price: game.price,
            about: game.about ?? "",
            isPopular: game.isPopular
        )
    }
    
    func readData() {
        adapter.readData { data in
            self.gamesForCart = data
        }
    }
    
    func writeData() {
        let gameForCart = convertModel(game: selectedGame!)
        gamesForCart.append(gameForCart)
        adapter.writeData(game: gamesForCart)
    }
    
    func readDataForWishlist() {
        adapterForWishlist.readData { data in
            self.gamesForWishlist = data
        }
    }
    
    func writeToWishlist() {
        if selectedGame != nil {
            let gameForWishlist = convertModel(game: selectedGame!)
            gamesForWishlist.append(gameForWishlist)
        } else {
            gamesForWishlist.append(selectedGameFromCart!)
        }
        adapterForWishlist.writeData(game: gamesForWishlist)
    }
    
    func removeFromWishlist() {
        guard let selectedGame = selectedGame else {
            print("Error: selectedGame is nil")
            return
        }
        let gameForWishlist = convertModel(game: selectedGame)
        guard let index = gamesForWishlist.firstIndex(of: gameForWishlist) else {
            print("Error: Game not found in wishlist")
            return
        }
        gamesForWishlist.remove(at: index)
        adapterForWishlist.writeData(game: gamesForWishlist)
    }
}

