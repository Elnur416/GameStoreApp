//
//  GamesForCategoryViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 06.01.25.
//

import Foundation

class GamesForCategoryViewModel {
    var selectedCategory: String?
    var gamesForcategory = [Game]()
    private var allGames = [Game]()
    private let managerGame = CoreDataForGame(context: AppDelegate().persistentContainer.viewContext)
    
    func fetchGames() {
        managerGame.fetchData { data in
            self.allGames = data
        }
    }
    
    func getGamesForCategory() {
        gamesForcategory = allGames.filter({ $0.category?.contains(selectedCategory ?? "") ?? false })
    }
}
