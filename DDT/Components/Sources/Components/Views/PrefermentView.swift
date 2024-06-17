import SwiftUI

public struct PrefermentView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension PrefermentView {
  public var body: some View {
    VStack {
      TemperatureAdjusterView(for: .preferment,
                              temperature: $temperatures.preferment)
    }
  }
}

#Preview {
  PrefermentView(temperatures: IngredientTemperature())
}

