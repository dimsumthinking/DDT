import SwiftUI

struct MiniTemperatureDisplay: View {
  let temperature: Temperature
  let ingredient: Ingredient
}

extension MiniTemperatureDisplay  {
  var body: some View {
    HStack {
      MiniIngredientNameView(ingredient: ingredient)
      FormattedTemperatureDisplay(formattedTemp: temperature.displayTemperature(for: ingredient))
    }
  }
}

#Preview {
  MiniTemperatureDisplay(temperature: 27,
                         ingredient: .ddt)
}


