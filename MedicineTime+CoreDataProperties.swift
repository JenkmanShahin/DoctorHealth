//
//  MedicineTime+CoreDataProperties.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 02.02.23.
//
//

import Foundation
import CoreData


extension MedicineTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MedicineTime> {
        return NSFetchRequest<MedicineTime>(entityName: "MedicineTime")
    }

    @NSManaged public var morningPill: String?
    @NSManaged public var noonPill: String?
    @NSManaged public var eviningPill: String?
    @NSManaged public var name: String?

}

extension MedicineTime : Identifiable {

}
