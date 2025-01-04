//
//  Category+CoreDataProperties.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var colour: String?

}

extension Category : Identifiable {

}
