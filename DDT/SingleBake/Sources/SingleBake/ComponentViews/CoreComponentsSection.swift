import SwiftUI
import Components

struct CoreComponentsSection: View {
  @Bindable var temperatures: IngredientTemperature
}

extension CoreComponentsSection {
  var body: some View {
    Section {
      DDTView(temperatures: temperatures)
      AmbientView(temperatures: temperatures)
      FlourView(temperatures: temperatures)
      if temperatures.hasPreferment {
        PrefermentView(temperatures: temperatures)
      }
      Button(temperatures.hasPreferment ? "Remove Preferment" : "Include Preferment") {
        self.temperatures.hasPreferment.toggle()
      }
    }
    .animation(.default,
               value: temperatures.hasPreferment)
  }
}

#Preview {
  CoreComponentsSection(temperatures: IngredientTemperature())
}
