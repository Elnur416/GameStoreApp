//
//  CategoriesViewModel.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation

class CategoriesViewModel {
    var categories = [Category]()
    private let managerCategory = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    private let gameDatas = GameDatas()
    
    func fetchCategories() {
        managerCategory.fetchData { categories in
            self.categories = categories
        }
    }
}
