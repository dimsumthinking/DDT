import SwiftUI

public struct MiniTemperatureDisplay {
  let temperature: Temperature
  let component: Component
  
  public init(_ temperature: Temperature,
              for component: Component) {
    self.temperature = temperature
    self.component = component
  }
}

extension MiniTemperatureDisplay: View {
  public var body: some View {
    HStack {
      Text(component.shortDescription)
      FormattedTemperatureDisplay(formattedTemp: temperature.displayTemperature(for: component))
    }
  }
}

struct MiniTemperatureDisplay_Previews: PreviewProvider {
  static var previews: some View {
    MiniTemperatureDisplay(76,
                           for: .ddt)
    .previewLayout(.sizeThatFits)
  }
}


