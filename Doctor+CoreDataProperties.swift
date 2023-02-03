//
//  Doctor+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 03.02.23.
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

}

extension Doctor : Identifiable {

}
