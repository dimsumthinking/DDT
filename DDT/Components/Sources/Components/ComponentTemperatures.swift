import Observation

@Observable
public class ComponentTemperatures {
  public var ddt: Double = Component.ddt.defaultTemp
  public var flour: Double = Component.flour.defaultTemp
  public var preferment: Double = Component.preferment.defaultTemp
  public var ambient: Double = Component.ambient.defaultTemp
  public var friction: Double = Component.friction.defaultTemp
  public var hasPreferment: Bool = false
  
  public init() {}
  public init(ddt: Double,
              friction: Double,
              hasPreferment: Bool) {
    self.ddt = ddt
    self.friction = friction
    self.hasPreferment = hasPreferment
  }
}

extension ComponentTemperatures {
  public func waterTemperature() -> Double {
      if hasPreferment {
        return ddt * 4 - flour - ambient - friction - preferment
      } else {
        return ddt * 3 - flour - ambient - friction
      }
    }
}
