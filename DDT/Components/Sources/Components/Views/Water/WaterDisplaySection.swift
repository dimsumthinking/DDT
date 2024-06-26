import SwiftUI

public struct WaterDisplaySection: View {
  @Bindable var temperatures: IngredientTemperature
  
  public init(temperatures: IngredientTemperature) {
    self.temperatures = temperatures
  }
}

extension WaterDisplaySection {
  public var body: some View {
    Section {
      WaterDisplay(temperatures)
    }
  }
}

#Preview {
  WaterDisplaySection(temperatures:  IngredientTemperature())
}

