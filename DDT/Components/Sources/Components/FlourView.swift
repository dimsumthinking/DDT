import SwiftUI

public struct FlourView {
  @Bindable var temperatures: ComponentTemperatures
  
  public init(temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension FlourView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperatures.flour,
                         for: Component.flour)
      Slider(value: $temperatures.flour,
             in: Component.flour.range)
    }
  }
}

