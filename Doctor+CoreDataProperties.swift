//
//  Doctor+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 27.01.23.
//
//

import Foundation
import CoreData


extension Doctor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doctor> {
        return NSFetchRequest<Doctor>(entityName: "Doctor")
    }

    @NSManaged public var desText: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var termin: NSSet?

}

// MARK: Generated accessors for termin
extension Doctor {

    @objc(addTerminObject:)
    @NSManaged public func addToTermin(_ value: Termine)

    @objc(removeTerminObject:)
    @NSManaged public func removeFromTermin(_ value: Termine)

    @objc(addTermin:)
    @NSManaged public func addToTermin(_ values: NSSet)

    @objc(removeTermin:)
    @NSManaged public func removeFromTermin(_ values: NSSet)

}

extension Doctor : Identifiable {

}
