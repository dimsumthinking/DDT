import SwiftUI
import Components

struct ComponentsList {
  @AppStorage("HasPreferment") var hasPreferment = false
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
      }
    }
}

struct ComponentsList_Previews: PreviewProvider {
    static var previews: some View {
      ComponentsList(hasPreferment: true)
        .environmentObject(ComponentValues())
    }
}
