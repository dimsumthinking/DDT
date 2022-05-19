import SwiftUI
import Utilities
import HelperViews

struct ClassicView {
  @AppStorage("HasPreferment") var hasPreferment = false
  @AppStorage("Desired") var desired = defaultTemp
  @AppStorage("Flour") var flour = defaultTemp
  @AppStorage("Preferment") var preferment = defaultTemp
  @AppStorage("Ambient") var ambient = defaultTemp
  @AppStorage("Friction") var friction = defaultMixerFrictionTemp
  @EnvironmentObject private var appStatus: AppStatus
}

extension ClassicView: View {
  var body: some View {
    NavigationView {
      List {
        TempView(name: "Water",
                 temp: water)

        ComponentView(name: "Desired",
                      range: desiredRange,
                      temp: $desired)
        ComponentView(name: "Ambient",
                      range: defaultRange,
                      temp: $ambient)
        ComponentView(name: "Flour",
                      range: defaultRange,
                      temp: $flour)
        if hasPreferment {
          ComponentView(name: "Preferment",
                        range: defaultRange,
                        temp: $preferment)
        }
      }
      .navigationBarTitle("DDT Calculator \(appStatus.temperatureScaleIndicator)")
      .navigationBarItems(trailing: PrefermentSwitch(hasPreferment: $hasPreferment))
//      .toolbar {
//        ToolbarItemGroup(placement: .bottomBar) {
//          Button {self.toolbarType = .help}
//            label: {Image(systemName: "info.circle")}
//          Spacer()
//          Button {self.toolbarType = .settings}
//            label: {Image(systemName: "gear")}
//        }
//      }

    }
    .navigationViewStyle(StackNavigationViewStyle())
//    .sheet(item: $toolbarType) {toolbarType in
//      switch toolbarType {
//      case .help:
//        HelpView(toolbarType: $toolbarType)
//      case .settings:
//        SettingsView(toolbarType: $toolbarType,
//                     friction: $friction,
//                     isCelsius: $isCelsius,
//                     convertTempScale: convertTempScale)
//      }
//    }
  }
}

extension ClassicView {
  var water: Double {
//    if hasPreferment {
//      return desired * 4 - flour - ambient - friction - preferment
//    } else {
//      return desired * 3 - flour - ambient - friction
//    }
//  }
    waterTempFrom(ddt: desired,
                  flourTemp: flour,
                  ambientTemp: ambient,
                  prefermentTemp: hasPreferment ? preferment : nil,
                  frictionTemp: friction)
  }
}

