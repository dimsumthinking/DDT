import SwiftUI

public struct TemperatureDisplay {
  let temperature: Temperature
  let component: Component
  @AppStorage("isCelsius") private var isCelsius = false
  
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
      formattedTemperature
    }
  }
}

extension TemperatureDisplay {
  private var formattedTemperature: Text {
    switch component {
    case .friction:
      return Text(temperature.affineTemperatureDisplay(isCelsius))
    default:
      return Text(temperature.temperatureDisplay(isCelsius))
    }
  }
}

struct TemperatureDisplay_Previews: PreviewProvider {
  static var previews: some View {
    TemperatureDisplay(27,
                       for: Component.ddt)
  }
}
