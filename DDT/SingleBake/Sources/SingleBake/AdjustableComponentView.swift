import SwiftUI
import Components

struct AdjustableComponentView {
  let type: ComponentType
  @State private var temp: Double = 0
  @EnvironmentObject private var componentValues: ComponentValues
}

extension AdjustableComponentView: View {
  var body: some View {
    ComponentView(for: type,
                 temp: $temp)
    .onChange(of: temp) { newValue in
      type.setValue(temp, in: componentValues)
    }
  }
}

import AppInfo

struct AdjustableComponentView_Previews: PreviewProvider {
  static var previews: some View {
    AdjustableComponentView(type: .flour)
      .environmentObject(ComponentValues())
      .environmentObject(AppStatus())
  }
}
