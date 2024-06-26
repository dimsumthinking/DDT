import SwiftUI
import Components

struct AdjustableNewMixComponents: View {
  @Bindable var temperatures: IngredientTemperature
}

extension AdjustableNewMixComponents  {
  var body: some View {
    VStack(spacing: 30) {
      DDTView(temperatures: temperatures)
      FrictionAdjustmentView(temperatures: temperatures)
      Toggle("Preferment", isOn: $temperatures.hasPreferment)
    }
  }
}

#Preview {
  AdjustableNewMixComponents(temperatures: IngredientTemperature())
}
