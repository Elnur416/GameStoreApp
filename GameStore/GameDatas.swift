//
//  GameDatas.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation

class GameDatas {
    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    let gameData = CoreDataForGame(context: AppDelegate().persistentContainer.viewContext)
    
    func loadData() {
//        categories
        let category1 = CategoryModel(name: "Heist",
                                      image: "heist",
                                      colour: "systemOrange")
        categoryData.saveData(category: category1)
        
        let category2 = CategoryModel(name: "Action",
                                      image: "action",
                                      colour: "systemBrown")
        categoryData.saveData(category: category2)
        
        let category3 = CategoryModel(name: "Survival",
                                      image: "survival",
                                      colour: "systemBlue")
        categoryData.saveData(category: category3)
        
        let category4 = CategoryModel(name: "Shooter",
                                      image: "shooter",
                                      colour: "systemGrey2")
        categoryData.saveData(category: category4)
        
        let category5 = CategoryModel(name: "Adventure",
                                      image: "adventure",
                                      colour: "systemRed")
        categoryData.saveData(category: category5)
        
        let category6 = CategoryModel(name: "Fighting",
                                      image: "fighting",
                                      colour: "systemYellow")
        categoryData.saveData(category: category6)
    }
}
