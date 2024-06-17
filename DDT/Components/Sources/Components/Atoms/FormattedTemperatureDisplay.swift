import SwiftUI

struct FormattedTemperatureDisplay: View {
  let formattedTemp: (Bool) -> String
  @AppStorage("isCelsius") private var isCelsius = false
}

extension FormattedTemperatureDisplay {
  var body: some View {
    Text(formattedTemp(isCelsius))
  }
}

#Preview {
  FormattedTemperatureDisplay(formattedTemp: 85.displayTemperature(for: .water))
}

