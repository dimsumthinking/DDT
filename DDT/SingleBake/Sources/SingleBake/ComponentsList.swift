import SwiftUI
import Components
import AppInfo

struct ComponentsList {
  @AppStorage("HasPreferment") var hasPreferment = false
  @EnvironmentObject private var appStatus: AppStatus
}

extension ComponentsList: View {
  var body: some View {
    List {
      Section {
        WaterView()
      }
      Section {
        AdjustableComponentView(type: .ddt)
        AdjustableComponentView(type: .ambient)
        AdjustableComponentView(type: .flour)
        if hasPreferment {
          AdjustableComponentView(type: .preferment)
        }
      }
      PrefermentToggleButton(hasPreferment: $hasPreferment)
      if appStatus.showFrictionSingleBake {
        Section {
          FrictionView()
        }
      }
    }
  }
}

struct ComponentsList_Previews: PreviewProvider {
  static var previews: some View {
    ComponentsList(hasPreferment: true)
      .environmentObject(ComponentValues())
  }
}
