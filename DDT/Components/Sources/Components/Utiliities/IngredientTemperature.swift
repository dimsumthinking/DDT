import Observation

@Observable
public class IngredientTemperature {
  public var ddt: Double = Ingredient.ddt.defaultTemp
  public var flour: Double = Ingredient.flour.defaultTemp
  public var preferment: Double = Ingredient.preferment.defaultTemp
  public var ambient: Double = Ingredient.ambient.defaultTemp
  public var friction: Double = Ingredient.friction.defaultTemp
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

extension IngredientTemperature {
  public func waterTemperature() -> Double {
      if hasPreferment {
        return ddt * 4 - flour - ambient - friction - preferment
      } else {
        return ddt * 3 - flour - ambient - friction
      }
    }
}

