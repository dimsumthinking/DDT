import SwiftUI

struct FormattedTemperatureDisplay {
  let formattedTemp: (Bool) -> String
  @AppStorage("isCelsius") private var isCelsius = false
}

extension FormattedTemperatureDisplay: View {
  var body: some View {
    Text(formattedTemp(isCelsius))
  }
}

struct FormattedTemperatureDisplay_Previews: PreviewProvider {
  static var previews: some View {
    FormattedTemperatureDisplay(formattedTemp: {_ in "55 ºC"})
  }
}

