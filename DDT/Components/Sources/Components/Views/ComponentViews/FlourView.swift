import SwiftUI

public struct FlourView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension FlourView {
  public var body: some View {
    VStack {
      TemperatureAdjusterView(for: .flour,
                              temperature: $temperatures.flour)
    }
  }
}

#Preview {
  FlourView(temperatures: IngredientTemperature())
}

