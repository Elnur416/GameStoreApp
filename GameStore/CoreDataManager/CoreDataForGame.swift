//
//  CoreDataForGame.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation
import CoreData

class CoreDataForGame {
    var context = AppDelegate().persistentContainer.viewContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchData(completion: (([Game]) -> Void)) {
        do {
            let data = try context.fetch(Game.fetchRequest())
            completion(data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(game: GameModel) {
        let model = Game(context: context)
        model.name = game.name
        model.mainImage = game.mainImage
        model.customImage = game.customImage
        model.price = game.price ?? 0
        model.category = game.category.name
        model.about = game.about
        model.isPopular = game.isPopular ?? false
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
