import SwiftData
import Foundation

@Model
public class Mix {
  public var name: String
  public var lastUsed: Date
  public var hasPreferment: Bool
  public var desiredDoughTemperature: Double
  public var frictionCoefficient: Double
  
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
