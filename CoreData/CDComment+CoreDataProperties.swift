//
//  CDComment+CoreDataProperties.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//
//

import Foundation
import CoreData


extension CDComment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDComment> {
        return NSFetchRequest<CDComment>(entityName: "CDComment")
    }

    @NSManaged public var id: Int64
    @NSManaged public var postId: Int64
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var body: String?

}

extension CDComment : Identifiable {

}
