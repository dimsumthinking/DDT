import SwiftUI

public struct FrictionSection: View {
  @State private var canAdjustFriction = false
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension FrictionSection {
  public var body: some View {
    Section {
      if canAdjustFriction {
        FrictionAdjustmentView(temperatures: temperatures)
        .listRowSeparator(.hidden)
      } else {
        FrictionDisplay(temperatures: temperatures)
        .listRowSeparator(.hidden)
      }
      Button(canAdjustFriction ? "Stop Adjusting Friction" : "Adjust Friction") {
        self.canAdjustFriction.toggle()
      }
      .buttonStyle(ListButtonStyle())
    }
    .animation(.default,
               value: canAdjustFriction)
  }
}

#Preview {
  FrictionSection(temperatures: IngredientTemperature())
}

