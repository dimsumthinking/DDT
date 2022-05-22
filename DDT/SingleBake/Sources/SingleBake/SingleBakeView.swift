import SwiftUI
import AppInfo
import Components
import HelperViews

public struct SingleBakeView {
  @AppStorage("HasPreferment") var hasPreferment = false
  @EnvironmentObject private var appStatus: AppStatus
  public init(){}
}

extension SingleBakeView: View {
  public var body: some View {
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
      ButtonInAList(text: "Adjust Friction Factor",
                    action: {})
    }
    .navigationTitle("Temps \(appStatus.temperatureScaleIndicator)")
    .toolbar {
      ToolbarItem(placement: .automatic ){ PrefermentSwitch(hasPreferment: $hasPreferment)
      }
    }
  }
}

struct SingleBakeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
    SingleBakeView()
      .environmentObject(AppStatus())
      .environmentObject(ComponentValues())
    }
  }
}
