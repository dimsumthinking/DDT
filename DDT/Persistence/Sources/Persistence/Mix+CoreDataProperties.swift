//
//  Mix+CoreDataProperties.swift
//  DDT
import Foundation
import CoreData


extension Mix {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Mix> {
    return NSFetchRequest<Mix>(entityName: "Mix")
  }
  
  @NSManaged public var name: String
  @NSManaged public var desiredDoughTemperature: Double
  @NSManaged public var hasPreferment: Bool
  @NSManaged public var frictionCoefficient: Double
  @NSManaged public var lastUsed: Date
}

extension Mix: Identifiable {}
