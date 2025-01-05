//
//  CoreDataForCategory.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation
import CoreData

class CoreDataForCategory {
    var context = AppDelegate().persistentContainer.viewContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchData(completion: (([Category]) -> Void)) {
        do {
            let data = try context.fetch(Category.fetchRequest())
            completion(data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(category: CategoryModel) {
        let model = Category(context: context)
        model.name = category.name
        model.image = category.image
        model.colour = category.colour
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
