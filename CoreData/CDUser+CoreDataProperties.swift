//
//  CDUser+CoreDataProperties.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?

}

extension CDUser : Identifiable {

}
