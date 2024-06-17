import SwiftUI

public struct MiniTemperatureDisplay {
  let temperature: Temperature
  let ingredient: Ingredient
  
  public init(_ temperature: Temperature,
              for ingredient: Ingredient) {
    self.temperature = temperature
    self.ingredient = ingredient
  }
}

extension MiniTemperatureDisplay: View {
  public var body: some View {
    HStack {
      MiniIngredientNameView(ingredient: ingredient)
      FormattedTemperatureDisplay(formattedTemp: temperature.displayTemperature(for: ingredient))
    }
  }
}

#Preview {
  MiniTemperatureDisplay(27,
                         for: .ddt)
}


