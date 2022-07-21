import Combine

public class ComponentTemperatures: ObservableObject {
  @Published public var ddt: Double = Component.ddt.defaultTemp
  @Published public var flour: Double = Component.flour.defaultTemp
  @Published public var preferment: Double = Component.preferment.defaultTemp
  @Published public var ambient: Double = Component.ambient.defaultTemp
  @Published public var friction: Double = Component.friction.defaultTemp
  
  public init() {}
  public init(ddt: Double,
              friction: Double) {
    self.ddt = ddt
    self.friction = friction
  }
}

extension ComponentTemperatures {
  public func waterTemperature(hasPreferment: Bool = false) -> Double {
      if hasPreferment {
        return ddt * 4 - flour - ambient - friction - preferment
      } else {
        return ddt * 3 - flour - ambient - friction
      }
    }
}
