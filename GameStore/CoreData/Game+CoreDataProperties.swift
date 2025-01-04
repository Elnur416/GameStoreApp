//
//  Game+CoreDataProperties.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var name: String?
    @NSManaged public var mainImage: String?
    @NSManaged public var customImage: String?
    @NSManaged public var price: Double
    @NSManaged public var about: String?
    @NSManaged public var isLiked: Bool
    @NSManaged public var category: String?

}

extension Game : Identifiable {

}
