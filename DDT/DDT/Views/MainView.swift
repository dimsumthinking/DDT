import SwiftUI

struct MainView {
  @State private var selection: Component?
  @EnvironmentObject private var temp: Temps
}

extension MainView: View {
  var body: some View {
    NavigationView {
      
      List {
        Section(footer: PrefermentSwitch(hasPreferment: $temp.hasPreferment)) {
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
        Section(header: Text("Tap to select value to modify:")) {
          ForEach(temp.activeTypes, id: \.self) {component in
            if temp.hasPreferment || component != .preferment {
              ComponentView(component: component,
                        currentType: $selection)
            }
          }
        }
        Section(header: FrictionSwitch(autoFriction: $temp.autoFriction)) {
          ForEach(temp.frictionType, id: \.self) {component in
              ComponentView(component: component,
                        currentType: $selection)
          }
        }
      }
    
      .listStyle(GroupedListStyle())
      .navigationTitle("DDT Calculator")
    }
  }
}
