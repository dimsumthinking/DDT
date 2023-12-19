import SwiftData
import Foundation

@Model
public class Mix {
  public var name: String = ""
  public var lastUsed: Date = Date()
  public var hasPreferment: Bool = false
  public var desiredDoughTemperature: Double = 76
  public var frictionCoefficient: Double = 2
  
  public init(name: String,
              desiredDoughTemperature: Double,
              frictionCoefficient: Double,
              hasPreferment: Bool) {
    self.name = name
    self.desiredDoughTemperature = desiredDoughTemperature
    self.frictionCoefficient = frictionCoefficient
    self.hasPreferment = hasPreferment
    self.lastUsed = Date()
  }
}

extension Mix { //URL in and out
  public static func createMix(from url: URL,
                               existingMixes: [Mix],
                               context: ModelContext) { // for imported mixers
    let components = URLComponents(url: url,
                                   resolvingAgainstBaseURL: true)
    guard let queryItems = components?.queryItems,
          var name = components?.host,
          let desiredDoughTemperature = queryValue(named: "d",
                                                   in: queryItems).flatMap(Double.init),
          let frictionCoefficient = queryValue(named: "f",
                                               in: queryItems).flatMap(Double.init),
          let hasPreferment = queryValue(named: "pf",
                                         in: queryItems).flatMap(Bool.init) else { return }
    if existingMixes.map(\.name).contains(name) {
      name = name + "+"
    }
    
    context.insert(Mix(name: name,
              desiredDoughTemperature: desiredDoughTemperature,
              frictionCoefficient: frictionCoefficient,
              hasPreferment: hasPreferment))
    do {
      try context.save()
    } catch {
      print("unable to create mix named \(name) from url")
    }
  }
  
  fileprivate static func queryValue(named name: String,
                          in items: [URLQueryItem]) -> String? {
    
    items.first {item in
      item.name == name
    }?.value
  }
  
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
