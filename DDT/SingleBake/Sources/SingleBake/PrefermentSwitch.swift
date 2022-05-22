import SwiftUI
import Components

struct PrefermentSwitch {
  @Binding var hasPreferment: Bool
  @EnvironmentObject private var componentValues: ComponentValues
}

extension PrefermentSwitch: View {
  var body: some View {
    Toggle("Preferment",
           isOn: $hasPreferment)
    .onChange(of: hasPreferment){hasPreferment in
      componentValues.setPreferment(hasPreferment)
    }
  }
}
