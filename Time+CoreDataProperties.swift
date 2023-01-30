//
//  Time+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 27.01.23.
//
//

import Foundation
import CoreData


extension Time {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Time> {
        return NSFetchRequest<Time>(entityName: "Time")
    }

    @NSManaged public var hour: String?
    @NSManaged public var isBooked: Bool
    @NSManaged public var timeOfTermin: Termine?

}

extension Time : Identifiable {

}
