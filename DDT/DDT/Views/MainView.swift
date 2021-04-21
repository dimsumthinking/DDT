import SwiftUI

struct MainView {
  @State private var selection: Component?
  @EnvironmentObject private var temp: Temps
  @State private var isShowingSettings = false
  @State private var isShowingHelp = false
}

extension MainView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          HStack(spacing: 10) {
            Text("Water Temp")
            Spacer()
            Text(temp.water.tempDisplay)
          }
          .foregroundColor(.blue)
          .contentShape(Rectangle())
          .onTapGesture {
            selection = nil
          }
        }
        Section(header: Text("Tap to modify value:")) {
          ForEach(baseTypes) {component in
            ComponentView(component: component,
                          currentType: $selection)
          }
        }
        Section(header: PrefermentSwitch(hasPreferment: $temp.hasPreferment)){
          if temp.hasPreferment {
            ComponentView(component: .preferment,
                          currentType: $selection)
          }
        }
        
        
        //        Section(header: FrictionSwitch(autoFriction: $temp.autoFriction)) {
        //          ForEach(temp.frictionType, id: \.self) {component in
        //              ComponentView(component: component,
        //                        currentType: $selection)
        //          }
        //        }
      }
      
      .listStyle(GroupedListStyle())
      .navigationBarTitle("DDT Calculator")
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
