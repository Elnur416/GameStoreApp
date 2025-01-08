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
    var discountedPrice: Double?
    let about: String?
    let isLiked: Bool?
    let category: CategoryModel
}

struct CategoryModel: Codable {
    let name: String?
    let image: String?
    let colour: String?
}

//struct GameForCart: Codable {
//    let name: String?
//    let mainImage: String?
//    let customImage: String?
//    let price: Double?
//    var discountedPrice: Double?
//    let about: String?
//    let isLiked: Bool?
//}

struct GameForCart: Equatable, Codable {
    let name: String
    let mainImage: String
    let customImage: String
    let price: Double
    let discountedPrice: Double
    let about: String
    let isLiked: Bool

    // Define equality for GameForCart
    static func == (lhs: GameForCart, rhs: GameForCart) -> Bool {
        return lhs.name == rhs.name &&
               lhs.mainImage == rhs.mainImage &&
               lhs.price == rhs.price &&
               lhs.discountedPrice == rhs.discountedPrice
    }
}
