import SwiftUI

public struct TemperatureDisplay {
  let temperature: Temperature
  let ingredient: Ingredient
  
  public init(_ temperature: Temperature,
              for ingredient: Ingredient) {
    self.temperature = temperature
    self.ingredient = ingredient
  }
}

extension TemperatureDisplay: View {
  public var body: some View {
    HStack {
      IngredientNameView(ingredient: ingredient)
      FormattedTemperatureDisplay(formattedTemp: temperature.displayTemperature(for: ingredient))
    }
  }
}

#Preview {
  TemperatureDisplay(27,
                     for: .ddt)
}

