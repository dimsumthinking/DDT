import SwiftUI

public struct DDTView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension DDTView {
  public var body: some View {
    VStack {
      TemperatureAdjusterView(for: .ddt,
                              temperature: $temperatures.ddt)
    }
  }
}

#Preview {
  DDTView(temperatures: IngredientTemperature())
}
