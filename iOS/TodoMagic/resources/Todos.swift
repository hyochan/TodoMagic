//
//  Todos+CoreDataClass.swift
//  TodoMagic
//
//  Created by hyochan on 2020/03/22.
//  Copyright © 2020 dooboolab. All rights reserved.
//
//

import Foundation
import CoreData

public class Todos: NSManagedObject, Identifiable {
//    @NSManaged public var id: UUID?
//    @NSManaged public var title: String?
//    @NSManaged public var content: String?
//    @NSManaged public var createdAt: Date?
//    @NSManaged public var updatedAt: Date?
}

extension Todos {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todos> {
//        return NSFetchRequest<Todos>(entityName: "Todos")
//    }
    
    static func getAllTodos() -> NSFetchRequest<Todos> {
        let request: NSFetchRequest<Todos> = Todos.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        return request
    }


}
