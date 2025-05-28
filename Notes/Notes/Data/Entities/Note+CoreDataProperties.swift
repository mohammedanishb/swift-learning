//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?

}

extension Note : Identifiable {

}
