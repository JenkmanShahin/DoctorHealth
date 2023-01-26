//
//  Termine+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 26.01.23.
//
//

import Foundation
import CoreData


extension Termine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Termine> {
        return NSFetchRequest<Termine>(entityName: "Termine")
    }

    @NSManaged public var day: String?
    @NSManaged public var termin: [String]?
    @NSManaged public var doctor: Doctor?

}

extension Termine : Identifiable {

}
