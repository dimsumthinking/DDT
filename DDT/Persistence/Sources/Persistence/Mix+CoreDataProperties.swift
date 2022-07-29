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
//
//extension Mix {
//  public func searchForExistingMixes(named: String) -> Bool {
//    guard let mixes = try? newBackgroundContext()
//      .fetch(NSFetchRequest<Mix>(entityName: "Mix")),
//          !named.isEmpty else {return false}
//    return mixes
//      .filter{($0.name != self.name)
//        || ($0.hasPreferment != self.hasPreferment)
//        || ($0.desiredDoughTemperature != self.desiredDoughTemperature)
//        || ($0.frictionCoefficient != self.frictionCoefficient)
//      }
//      .map{mix in mix.name.lowercased()}.contains(named.lowercased())
//  }
//}

extension Mix {
  public static func existingNames(otherThanIn otherMix: Mix = namelessMix) -> [String] {
    guard let mixes = try? newBackgroundContext()
      .fetch(NSFetchRequest<Mix>(entityName: "Mix")) else {return []}
    return mixes
      .filter{($0.name != otherMix.name)
      || ($0.hasPreferment != otherMix.hasPreferment)
      || ($0.desiredDoughTemperature != otherMix.desiredDoughTemperature)
      || ($0.frictionCoefficient != otherMix.frictionCoefficient)
      }
      .map(\.name)
      .map{$0.lowercased()}
  }
  
  public static func alreadyUsing(name: String, in names: [String]) -> Bool {
    guard !(name.isEmpty) else {return false}
    return names.contains(name.lowercased())
  }
}

extension Mix {
  public var url: URL {
    var components = URLComponents()
    components.scheme = "ddt"
    components.host = name
    components.queryItems = [
      URLQueryItem(name: "d", value: desiredDoughTemperature.description),
      URLQueryItem(name: "f", value: frictionCoefficient.description),
      URLQueryItem(name: "pf", value: hasPreferment.description)
    ]
    return components.url ?? URL(string: "https://dimsumthinking.com")!
  }
}

//extension Mix {
//  public var url: URL {
//    var components = URLComponents()
//    components.scheme = "desiredDoughTemperature"
//    components.host = name
//    components.queryItems = [
//      URLQueryItem(name: "ddt", value: desiredDoughTemperature.description),
//      URLQueryItem(name: "friction", value: frictionCoefficient.description),
//      URLQueryItem(name: "hasPreferment", value: hasPreferment.description)
//    ]
//    return components.url ?? URL(string: "https://dimsumthinking.com")!
//  }
//}
