import SwiftUI

public struct FrictionView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension FrictionView {
  public var body: some View {
    TemperatureAdjusterView(for: .friction,
                            temperature: $temperatures.friction)
  }
}

#Preview {
  FrictionView(temperatures: IngredientTemperature())
}
