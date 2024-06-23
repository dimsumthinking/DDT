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

