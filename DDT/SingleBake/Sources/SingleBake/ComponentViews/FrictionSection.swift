import SwiftUI
import Components

struct FrictionSection: View {
  @State private var canAdjustFriction = false
  @Bindable var temperatures: IngredientTemperature
}

extension FrictionSection {
  var body: some View {
    Section {
      if canAdjustFriction {
        FrictionView(temperatures: temperatures)
        .listRowSeparator(.hidden)
      } else {
        TemperatureDisplay(temperatures.friction,
                           for: .friction)
        .listRowSeparator(.hidden)
      }
      Button(canAdjustFriction ? "Stop Adjusting Friction" : "Adjust Friction") {
        self.canAdjustFriction.toggle()
      }
    }
    .animation(.default,
               value: canAdjustFriction)
  }
}

#Preview {
  FrictionSection(temperatures: IngredientTemperature())
}
