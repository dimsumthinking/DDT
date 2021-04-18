import SwiftUI

struct MainView {
  @State private var selection: Component?
  @EnvironmentObject private var temp: Temps
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
        }
        Section(header:
                  VStack {
                    Text("Tap to select value to modify:")
                    PrefermentSwitch(hasPreferment: $temp.hasPreferment)
                  }) {
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
        
        Section {
          if let currentType = selection {
            TempSlider(component: currentType)
          }
        }
      }
      .listStyle(GroupedListStyle())
      
      .navigationTitle("DDT Calculator")
    }
  }
}
