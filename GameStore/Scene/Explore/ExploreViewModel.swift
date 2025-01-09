//
//  ExploreViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 05.01.25.
//

import Foundation

class ExploreViewModel {
    var games = [Game]()
    private let gameData = GameDatas()
    private let managerGame = CoreDataForGame(context: AppDelegate().persistentContainer.viewContext)
    let manager = UserDefaultsManager()
    var filteredGames = [Game]()
    
    func loadData() {
        gameData.loadData()
        manager.setValue(value: true, key: .isDataLoaded)
    }
    
    func fetchGames() {
        managerGame.fetchData { data in
            self.games = data
        }
    }
}

