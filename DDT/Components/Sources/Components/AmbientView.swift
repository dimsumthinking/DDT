import SwiftUI

public struct AmbientView {
  @Bindable var temperatures: ComponentTemperatures
  
  public init(temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension AmbientView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperatures.ambient,
                         for: Component.ambient)
      Slider(value: $temperatures.ambient,
             in: Component.ambient.range)
    }
  }
}

