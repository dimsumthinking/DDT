import SwiftUI

public struct TemperatureAdjusterView: View {
  let ingredient: Ingredient
  @Binding var temperature: Temperature
  
  init(for ingredient: Ingredient,
       temperature: Binding<Double>) {
    self.ingredient = ingredient
    self._temperature = temperature
  }
}

extension TemperatureAdjusterView {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperature,
                         for: ingredient)
      Slider(value: $temperature,
             in: ingredient.range)
    }
  }
}

