import SwiftUI

public struct WaterDisplay {
   private(set) var temperatures: ComponentTemperatures
  let component = Component.water
  
  public init(_ temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension WaterDisplay: View {
  public var body: some View {
    HStack {
      Text(component.description)
      Spacer()
      FormattedTemperatureDisplay(formattedTemp: formattedTemperature)
    }
  }
}

extension WaterDisplay {
  private var formattedTemperature: (Bool) -> String {
    temperatures
      .waterTemperature().displayTemperature(for: component)
  }
}

