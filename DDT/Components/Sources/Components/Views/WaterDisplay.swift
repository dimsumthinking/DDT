import SwiftUI

public struct WaterDisplay: View {
  let temperatures: IngredientTemperature

  public init(_ temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension WaterDisplay {
  public var body: some View {
    HStack {
      IngredientNameView(ingredient: .water)
      Spacer()
      FormattedTemperatureDisplay(formattedTemp: temperatures.waterTemperature().displayTemperature(for: .water))
    }
  }
}

#Preview {
  WaterDisplay(IngredientTemperature())
}


