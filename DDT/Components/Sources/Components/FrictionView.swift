import SwiftUI

public struct FrictionView {
  @Bindable var temperatures: ComponentTemperatures
  
  public init(temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension FrictionView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperatures.friction,
                         for: Component.friction)
      Slider(value: $temperatures.friction,
             in: Component.friction.range)
    }
  }
}

