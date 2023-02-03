//
//  Termin+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 03.02.23.
//
//

import Foundation
import CoreData


extension Termin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Termin> {
        return NSFetchRequest<Termin>(entityName: "Termin")
    }

    @NSManaged public var termin: String?

}

extension Termin : Identifiable {

}
