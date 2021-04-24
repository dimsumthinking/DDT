import SwiftUI

struct MainView {
  @State private var isShowingSettings = false
  @State private var isShowingHelp = false
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
                      range: desiredRange(inCelsius: isCelsius))
        ComponentView(name: "Flour",
                      temp: $flour,
                      range: desiredRange(inCelsius: isCelsius))
        if hasPreferment {
          ComponentView(name: "Preferment",
                        temp: $preferment,
                        range: desiredRange(inCelsius: isCelsius))
        }
      }
      .navigationBarTitle("DDT Calculator")
      .navigationBarItems(trailing: PrefermentSwitch(hasPreferment: $hasPreferment))
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button {self.isShowingHelp.toggle()}
            label: {Image(systemName: "info.circle")}
          Spacer()
          Button {self.isShowingSettings.toggle()}
            label: {Image(systemName: "gear")}
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .sheet(isPresented: $isShowingSettings) {
      SettingsView(isShowingSettings: $isShowingSettings,
                   friction: $friction,
                   isCelsius: $isCelsius)
    }
    .sheet(isPresented: $isShowingHelp) {
      HelpView(isShowingHelp: $isShowingHelp)
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
