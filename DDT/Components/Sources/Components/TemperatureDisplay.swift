import SwiftUI

public struct TemperatureDisplay {
  let temperature: Temperature
  let component: Component
  let spaced: Bool
  @AppStorage("isCelsius") private var isCelsius = false
  
  public init(_ temperature: Temperature,
              for component: Component,
              spaced: Bool = true) {
    self.temperature = temperature
    self.component = component
    self.spaced = spaced
  }
}

extension TemperatureDisplay: View {
  public var body: some View {
    HStack {
      if spaced {
        Text(component.description)
        Spacer()
      } else {
        Text(component.shortDescription)
      }
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
