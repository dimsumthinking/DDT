import SwiftUI

struct FrictionDisplay: View {
  let temperatures: IngredientTemperature
}

extension FrictionDisplay {
  var body: some View {
    HStack {
      IngredientNameView(ingredient: .friction)
      Spacer()
      FormattedTemperatureDisplay(formattedTemp:  temperatures.friction.displayTemperature(for: .friction))
    }
  }
}

#Preview {
  FrictionDisplay(temperatures: IngredientTemperature())
}
