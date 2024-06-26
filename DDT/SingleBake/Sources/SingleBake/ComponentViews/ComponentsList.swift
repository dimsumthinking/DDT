import SwiftUI
import Components

struct ComponentsList: View {
  @Bindable var temperatures: IngredientTemperature
}

extension ComponentsList {
  var body: some View {
    List {
      WaterDisplaySection(temperatures: temperatures)
      CoreComponentsSection(temperatures: temperatures)
      FrictionSection(temperatures: temperatures)
    }
    .buttonStyle(ListButtonStyle())
  }
}

#Preview {
    ComponentsList(temperatures: IngredientTemperature())
}
