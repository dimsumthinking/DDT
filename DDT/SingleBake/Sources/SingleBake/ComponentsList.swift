import SwiftUI
import Components

struct ComponentsList {
  @Binding var hasPreferment: Bool
  @State private var canAdjustFriction = false
  @ObservedObject var temperatures: ComponentTemperatures
}

extension ComponentsList: View {
  var body: some View {
    List {
      Section {
        WaterDisplay(temperatures,
                     hasPreferment: hasPreferment)
      }
      Section {
        if canAdjustFriction {
          ComponentView(.friction,
                        temperature: $temperatures.friction)
          .listRowSeparator(.hidden)
        } else {
          TemperatureDisplay(temperatures.friction,
                             for: .friction)
          .listRowSeparator(.hidden)
        }
        Button(canAdjustFriction ? "Stop Adjusting Friction" : "Adjust Friction") {
          self.canAdjustFriction.toggle()
        }
      }
      Section {
        ComponentView(.ddt,
                      temperature: $temperatures.ddt)
        ComponentView(.ambient,
                      temperature: $temperatures.ambient)
        ComponentView(.flour,
                      temperature: $temperatures.flour)
        if hasPreferment {
          ComponentView(.preferment,
                        temperature: $temperatures.preferment)
        }
        Button(hasPreferment ? "Remove Preferment" : "Include Preferment") {
          self.hasPreferment.toggle()
        }
      }

    }
    .animation(.default,
               value: hasPreferment)
    .animation(.default,
               value: canAdjustFriction)
    .buttonStyle(ListButtonStyle())
  }
}

struct ComponentsList_Previews: PreviewProvider {
  static var previews: some View {
    ComponentsList(hasPreferment: .constant(false),
                   temperatures: ComponentTemperatures())
  }
}
