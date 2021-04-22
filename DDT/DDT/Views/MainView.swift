import SwiftUI

struct MainView {
  @State private var isShowingSettings = false
  @State private var isShowingHelp = false
  @State private var hasPreferment = false
  @AppStorage("Desired") var desired = 76.0
  @AppStorage("Flour") var flour = 70.0
  @AppStorage("Preferment") var preferment = 70.0
  @AppStorage("Ambient") var ambient = 70.0
  @AppStorage("Friction") var friction = 20.0}

extension MainView: View {
  var body: some View {
    return NavigationView {
      List {
        TempView(name: "Water",
                 temp: water)
          .foregroundColor(.blue)
          .font(.title)
          .padding()
        
        ComponentView(name: "Desired",
                      temp: $desired,
                      range: desiredRange)
        ComponentView(name: "Ambient",
                      temp: $ambient,
                      range: defaultRange)
        ComponentView(name: "Flour",
                      temp: $flour,
                      range: defaultRange)
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
    .sheet(isPresented: $isShowingSettings){
      SettingsView(isShowingSettings: $isShowingSettings)
    }
    .sheet(isPresented: $isShowingHelp){
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
