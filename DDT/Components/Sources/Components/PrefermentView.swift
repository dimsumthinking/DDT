import SwiftUI

public struct PrefermentView {
  @Bindable var temperatures: ComponentTemperatures
  
  public init(temperatures: ComponentTemperatures) {
    self.temperatures = temperatures
  }
}

extension PrefermentView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperatures.preferment,
                         for: Component.preferment)
      Slider(value: $temperatures.preferment,
             in: Component.preferment.range)
    }
  }
}

