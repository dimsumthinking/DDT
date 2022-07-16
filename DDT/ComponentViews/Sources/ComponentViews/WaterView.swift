import SwiftUI
import Components

public struct WaterView {
  @EnvironmentObject private var componentValues: ComponentValues
  public init() {}
}

extension WaterView: View {
  public var body: some View {
    TempView(name: "Water",
             temp: componentValues.water)
  }
}

import AppInfo
struct WaterView_Previews: PreviewProvider {
  static var previews: some View {
    WaterView()
    .environmentObject(ComponentValues())
  }
}


