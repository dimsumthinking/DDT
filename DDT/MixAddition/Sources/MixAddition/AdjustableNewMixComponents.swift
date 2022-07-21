import SwiftUI
import Components

struct AdjustableNewMixComponents {
  @Binding var ddt: Double
  @Binding var friction: Double
  @Binding var hasPreferment: Bool
}

extension AdjustableNewMixComponents: View {
  var body: some View {
    Section {
      ComponentView(.ddt,
                    temperature: $ddt)
      ComponentView(.friction,
                    temperature: $friction)
      Toggle("Preferment", isOn: $hasPreferment)
    }
  }
}

struct AdjustableNewMixComponents_Previews: PreviewProvider {
  static var previews: some View {
    AdjustableNewMixComponents(ddt: .constant(76),
                               friction: .constant(24),
                               hasPreferment: .constant(false))
  }
}
