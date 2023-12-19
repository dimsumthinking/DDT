import SwiftUI
import Components

struct AdjustableNewMixComponents {
  @Bindable var temperatures: ComponentTemperatures
}

extension AdjustableNewMixComponents: View {
  var body: some View {
    VStack(spacing: 30) {
      DDTView(temperatures: temperatures)
      FrictionView(temperatures: temperatures)
      Toggle("Preferment", isOn: $temperatures.hasPreferment)
    }
  }
}
