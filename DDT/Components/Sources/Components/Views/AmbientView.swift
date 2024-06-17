import SwiftUI

public struct AmbientView: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension AmbientView {
  public var body: some View {
    TemperatureAdjusterView(for: .ambient,
                            temperature: $temperatures.ambient)
  }
}

#Preview {
  AmbientView(temperatures: IngredientTemperature())
}

