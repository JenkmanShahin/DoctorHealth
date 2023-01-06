//
//  User+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 06.01.23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var birthdate: Date?
    @NSManaged public var email: String?
    @NSManaged public var fullname: String?
    @NSManaged public var gender: String?
    @NSManaged public var height: Double
    @NSManaged public var password: String?
    @NSManaged public var weight: Double

}

extension User : Identifiable {

}
