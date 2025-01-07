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
    
    func convertModel(game: Game) -> GameForCart {
        return GameForCart(
            name: game.name,
            mainImage: game.mainImage,
            customImage: game.customImage,
            price: game.price,
            discountedPrice: game.discountedPrice,
            about: game.about,
            isLiked: game.isLiked
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
    
    func writeToWishlist() {
        let gameForWishlist = convertModel(game: selectedGame!)
        gamesForWishlist.append(gameForWishlist)
        adapterForWishlist.writeData(game: gamesForWishlist)
    }
}
