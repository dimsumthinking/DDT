import SwiftUI

public struct TemperatureDisplay {
  let temperature: Temperature
  let component: Component
  
  public init(_ temperature: Temperature,
              for component: Component) {
    self.temperature = temperature
    self.component = component
  }
}

extension TemperatureDisplay: View {
  public var body: some View {
    HStack {
      Text(component.description)
      Spacer()
      FormattedTemperatureDisplay(formattedTemp: temperature.displayTemperature(for: component))
    }
  }
}

struct TemperatureDisplay_Previews: PreviewProvider {
  static var previews: some View {
    TemperatureDisplay(27,
                       for: Component.ddt)
    .padding(.horizontal)
  }
}
