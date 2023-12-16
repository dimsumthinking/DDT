import SwiftUI

public struct DDTView {
  @Bindable var temperatures: ComponentTemperatures
  
  public init(temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension DDTView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperatures.ddt,
                         for: Component.ddt)
      Slider(value: $temperatures.ddt,
             in: Component.ddt.range)
    }
  }
}

