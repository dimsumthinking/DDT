import SwiftUI
import Components
import HelperViews

struct PrefermentToggleButton {
  @Binding var hasPreferment: Bool
  @EnvironmentObject private var componentValues: ComponentValues
}

extension PrefermentToggleButton: View {
  var body: some View {
    ButtonInAList(text: hasPreferment ? "Remove Preferment" : "Add Preferment") {
      hasPreferment.toggle()
      componentValues.setPreferment(hasPreferment)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    PrefermentToggleButton(hasPreferment: .constant(true))
  }
}
