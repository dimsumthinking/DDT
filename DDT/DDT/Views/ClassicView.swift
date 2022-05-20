import SwiftUI
import AppInfo
import HelperViews
import Components

struct ClassicView {
  @AppStorage("HasPreferment") var hasPreferment = false

  @EnvironmentObject private var appStatus: AppStatus
}

extension ClassicView: View {
  var body: some View {
      List {
        Section {
          WaterView()
        }
        Section {
          ComponentView(.ddt)
          ComponentView(.ambient)
          ComponentView(.flour)
          if hasPreferment {
            ComponentView(.preferment)
          }
        }
        ButtonInAList(text: "Adjust Friction Factor",
                      action: {})
      }
      .navigationBarTitle("Temps \(appStatus.temperatureScaleIndicator)")
      .navigationBarItems(trailing: PrefermentSwitch(hasPreferment: $hasPreferment))
  }
}


struct ClassicView_Previews: PreviewProvider {
  static var previews: some View {
    ClassicView()
      .environmentObject(AppStatus())
  }
}
