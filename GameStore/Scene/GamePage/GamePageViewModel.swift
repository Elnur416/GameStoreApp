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
    var isGameLiked: Bool?
    
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
        if selectedGame != nil {
            let game = convertModel(game: selectedGame!)
            guard let index = gamesForWishlist.firstIndex(of: game) else { return }
            gamesForWishlist.remove(at: index)
        } else {
            let game = selectedGameFromCart
            guard let index = gamesForWishlist.firstIndex(of: game!) else { return }
            gamesForWishlist.remove(at: index)
        }
        adapterForWishlist.writeData(game: gamesForWishlist)
    }
    
    func isGameLikedAction() -> Bool {
        if selectedGame != nil {
            if gamesForWishlist.contains(where: { $0.name == selectedGame!.name }) {
                return true
            } else {
                return false
            }
        } else {
            if gamesForWishlist.contains(where: { $0.name == selectedGameFromCart!.name }) {
                return true
            } else {
                return false
            }
        }
    }
}

