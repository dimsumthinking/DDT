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
//      ComponentView(.ddt,
//                    temperature: $ddt)
//      ComponentView(.friction,
//                    temperature: $friction)
      Toggle("Preferment", isOn: $temperatures.hasPreferment)
    }
  }
}

//import SwiftUI
//import Components
//
//struct AdjustableNewMixComponents {
//  @Binding var ddt: Double
//  @Binding var friction: Double
//  @Binding var hasPreferment: Bool
//}
//
//extension AdjustableNewMixComponents: View {
//  var body: some View {
//    VStack(spacing: 30) {
//      ComponentView(.ddt,
//                    temperature: $ddt)
//      ComponentView(.friction,
//                    temperature: $friction)
//      Toggle("Preferment", isOn: $hasPreferment)
//    }
//  }
//}


