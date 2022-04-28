//
//  Note.swift
//  Nano1_DF
//
//  Created by Della Florine on 28/04/22.
//

import CoreData

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var content: String!
    @NSManaged var deletedDate: Date?
}
