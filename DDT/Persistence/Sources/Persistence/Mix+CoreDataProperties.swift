//
//  Mix+CoreDataProperties.swift
//  DDT
//import Foundation
//import CoreData






//extension Mix {
//  public static func existingNames(otherThanIn otherMix: Mix = namelessMix) -> [String] {
//    guard let mixes = try? newBackgroundContext()
//      .fetch(NSFetchRequest<Mix>(entityName: "Mix")) else {return []}
//    return mixes
//      .filter{($0.name != otherMix.name)
//      || ($0.hasPreferment != otherMix.hasPreferment)
//      || ($0.desiredDoughTemperature != otherMix.desiredDoughTemperature)
//      || ($0.frictionCoefficient != otherMix.frictionCoefficient)
//      }
//      .map(\.name)
//      .map{$0.lowercased()}
//  }
  
//  public static func alreadyUsing(name: String, in names: [String]) -> Bool {
//    guard !(name.isEmpty) else {return false}
//    return names.contains(name.lowercased())
//  }
//}

//extension Mix {
//  public var url: URL {
//    var components = URLComponents()
//    components.scheme = "ddt"
//    components.host = name
//    components.queryItems = [
//      URLQueryItem(name: "d", value: desiredDoughTemperature.description),
//      URLQueryItem(name: "f", value: frictionCoefficient.description),
//      URLQueryItem(name: "pf", value: hasPreferment.description)
//    ]
//    return components.url ?? URL(string: "https://dimsumthinking.com")!
//  }
//}
