//
//  Game+CoreDataProperties.swift
//  GameStore
//
//  Created by Elnur Mammadov on 09.01.25.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var about: String?
    @NSManaged public var category: String?
    @NSManaged public var customImage: String?
    @NSManaged public var mainImage: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var isPopular: Bool

}

extension Game : Identifiable {

}
