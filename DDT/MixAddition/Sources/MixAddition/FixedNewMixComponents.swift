import SwiftUI
import Components

struct FixedNewMixComponents {
  let ddt: Double
  let friction: Double
  let hasPreferment: Bool
}

extension FixedNewMixComponents: View {
  var body: some View {
    VStack (spacing: 30) {
      TemperatureDisplay(ddt,
                         for: .ddt)
      TemperatureDisplay(friction,
                         for: .friction)
      if hasPreferment {
        Text("Includes preferment")
      } else {
        Text("No preferment")
      }
      
    }
  }
}

struct FixedNewMixComponents_Previews: PreviewProvider {
  static var previews: some View {
    FixedNewMixComponents(ddt: 76,
                    friction: 24,
                    hasPreferment: false)
  }
}
