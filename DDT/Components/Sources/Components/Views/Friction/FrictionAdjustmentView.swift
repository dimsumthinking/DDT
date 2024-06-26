import SwiftUI

public struct FrictionAdjustmentView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension FrictionAdjustmentView {
  public var body: some View {
    TemperatureAdjusterView(for: .friction,
                            temperature: $temperatures.friction)
  }
}

#Preview {
  FrictionAdjustmentView(temperatures: IngredientTemperature())
}
