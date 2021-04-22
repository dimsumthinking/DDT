import SwiftUI

struct MainView {
    @State private var isShowingSettings = false
    @State private var isShowingHelp = false
    @State private var hasPreferment = false
    @AppStorage("Desired") var desired = defaultTemp
    @AppStorage("Flour") var flour = defaultTemp
    @AppStorage("Preferment") var preferment = defaultTemp
    @AppStorage("Ambient") var ambient = defaultTemp
    @AppStorage("Friction") var friction = defaultFriction
}

extension MainView: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: - Result
                TempView(name: "Water",
                         temp: water)
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()

                // MARK: - Basic Inputs
                ComponentView(name: "Desired",
                              temp: $desired,
                              range: desiredRange)
                ComponentView(name: "Ambient",
                              temp: $ambient,
                              range: defaultRange)
                ComponentView(name: "Flour",
                              temp: $flour,
                              range: defaultRange)
              // MARK: - Preferment Input
                if hasPreferment {
                    ComponentView(name: "Preferment",
                                  temp: $preferment,
                                  range: defaultRange)
                }
                //        Section(header: FrictionSwitch(autoFriction: $temp.autoFriction)) {
                //          ForEach(temp.frictionType, id: \.self) {component in
                //              ComponentView(component: component,
                //                        currentType: $selection)
                //          }
                //        }
            }
            .navigationBarTitle("DDT Calculator")
            .navigationBarItems(trailing: PrefermentSwitch(hasPreferment: $hasPreferment))
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        self.isShowingHelp.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    Spacer()
                    Button {
                        self.isShowingSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(isShowingSettings: $isShowingSettings)
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
