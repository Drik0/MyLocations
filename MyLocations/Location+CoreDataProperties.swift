//
//  Location+CoreDataProperties.swift
//  MyLocations
//
//  Created by Gerson Costa on 17/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//
//

import Foundation
import CoreData
import CoreLocation


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var date: Date
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String

}
