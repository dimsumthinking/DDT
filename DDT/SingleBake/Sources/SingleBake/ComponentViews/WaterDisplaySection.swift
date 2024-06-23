import SwiftUI
import Components

struct WaterDisplaySection: View {
  @Bindable var temperatures: IngredientTemperature
}

extension WaterDisplaySection {
  var body: some View {
    Section {
      WaterDisplay(temperatures)
    }
  }
}

#Preview {
  WaterDisplaySection(temperatures:  IngredientTemperature())
}

