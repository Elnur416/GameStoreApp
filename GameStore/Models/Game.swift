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
    let isPopular: Bool?
    let about: String?
    let category: CategoryModel
}

struct CategoryModel: Codable {
    let name: String?
    let image: String?
    let colour: String?
}

struct GameForCart: Equatable, Codable {
    let name: String?
    let mainImage: String?
    let customImage: String?
    let price: Double?
    let about: String?
    let isPopular: Bool?

    static func == (lhs: GameForCart, rhs: GameForCart) -> Bool {
        return lhs.name == rhs.name &&
               lhs.mainImage == rhs.mainImage &&
               lhs.price == rhs.price &&
               lhs.customImage == rhs.customImage &&
               lhs.about == rhs.about &&
               lhs.isPopular == rhs.isPopular
    }
}

