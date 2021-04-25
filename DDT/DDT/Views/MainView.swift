import SwiftUI

struct MainView {
  @State private var toolbarType: ToolbarType?
  @State private var hasPreferment = false
  @AppStorage("Desired") var desired = defaultTemp()
  @AppStorage("Flour") var flour = defaultTemp()
  @AppStorage("Preferment") var preferment = defaultTemp()
  @AppStorage("Ambient") var ambient = defaultTemp()
  @AppStorage("Friction") var friction = defaultFriction()
  @AppStorage("TemperatureScale") var isCelsius = false
}

extension MainView: View {
  var body: some View {
    NavigationView {
      List {
        TempView(name: "Water",
                 temp: water)
          .foregroundColor(.blue)
          .font(.title)
          .padding()
        ComponentView(name: "Desired",
                      temp: $desired,
                      range: desiredRange(inCelsius: isCelsius))
        ComponentView(name: "Ambient",
                      temp: $ambient,
                      range: defaultRange(inCelsius: isCelsius))
        ComponentView(name: "Flour",
                      temp: $flour,
                      range: defaultRange(inCelsius: isCelsius))
        if hasPreferment {
          ComponentView(name: "Preferment",
                        temp: $preferment,
                        range: defaultRange(inCelsius: isCelsius))
        }
      }
      .navigationBarTitle("DDT Calculator º\(isCelsius ? "C" : "F")")
      .navigationBarItems(trailing: PrefermentSwitch(hasPreferment: $hasPreferment))
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button {self.toolbarType = .help}
            label: {Image(systemName: "info.circle")}
          Spacer()
          Button {self.toolbarType = .settings}
            label: {Image(systemName: "gear")}
        }
      }

    }
    .navigationViewStyle(StackNavigationViewStyle())
    .sheet(item: $toolbarType) {toolbarType in
      switch toolbarType {
      case .help:
        HelpView(toolbarType: $toolbarType)
      case .settings:
        SettingsView(toolbarType: $toolbarType,
                     friction: $friction,
                     isCelsius: $isCelsius,
                     convertTempScale: convertTempScale)
      }
    }
  }
}

extension MainView {
  var water: Double {
    if hasPreferment {
      return desired * 4 - flour - ambient - friction - preferment
    } else {
      return desired * 3 - flour - ambient - friction
    }
  }
}

extension MainView {
  func convertTempScale() {
    desired = tempScaleConversion(of: desired, toCelsius: isCelsius)
    flour = tempScaleConversion(of: flour, toCelsius: isCelsius)
    ambient = tempScaleConversion(of: ambient, toCelsius: isCelsius)
    preferment = tempScaleConversion(of: preferment, toCelsius: isCelsius)
    friction = affineTempScaleConversion(of: friction, toCelsius: isCelsius)
  }
}
