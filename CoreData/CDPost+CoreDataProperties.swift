//
//  CDPost+CoreDataProperties.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//
//

import Foundation
import CoreData


extension CDPost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPost> {
        return NSFetchRequest<CDPost>(entityName: "CDPost")
    }

    @NSManaged public var id: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension CDPost : Identifiable {

}
