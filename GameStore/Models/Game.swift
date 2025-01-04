//
//  Game.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation

struct GameModel: Codable {
    let name: String?
    let mainImage: String?
    let customImage: String?
    let price: Double?
    let about: String?
    let isLiked: Bool?
    let category: CategoryModel
}

struct CategoryModel: Codable {
    let name: String?
    let image: String?
    let colour: String?
}
