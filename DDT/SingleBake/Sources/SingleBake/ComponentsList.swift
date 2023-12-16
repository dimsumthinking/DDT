import SwiftUI
import Components

struct ComponentsList {
  @State private var canAdjustFriction = false
  @Bindable var temperatures: ComponentTemperatures
}

extension ComponentsList: View {
  var body: some View {
    List {
      Section {
        WaterDisplay(temperatures)
      }
      Section {
        if canAdjustFriction {
          FrictionView(temperatures: temperatures)
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
        DDTView(temperatures: temperatures)
        AmbientView(temperatures: temperatures)
        FlourView(temperatures: temperatures)
        if temperatures.hasPreferment {
          PrefermentView(temperatures: temperatures)
        }
        Button(temperatures.hasPreferment ? "Remove Preferment" : "Include Preferment") {
          self.temperatures.hasPreferment.toggle()
        }
      }

    }
    .animation(.default,
               value: temperatures.hasPreferment)
    .animation(.default,
               value: canAdjustFriction)
    .buttonStyle(ListButtonStyle())
  }
}

struct ComponentsList_Previews: PreviewProvider {
  static var previews: some View {
    ComponentsList(temperatures: ComponentTemperatures())
  }
}
