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

extension Mix {
  public func searchForExistingMixes(named: String) -> Bool {
    guard let mixes = try? newBackgroundContext()
      .fetch(NSFetchRequest<Mix>(entityName: "Mix")),
          !named.isEmpty else {return false}
    return mixes
      .filter{($0.name != self.name)
        || ($0.hasPreferment != self.hasPreferment)
        || ($0.desiredDoughTemperature != self.desiredDoughTemperature)
        || ($0.frictionCoefficient != self.frictionCoefficient)
      }
      .map{mix in mix.name.lowercased()}.contains(named.lowercased())
  }
}
