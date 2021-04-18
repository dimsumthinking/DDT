import SwiftUI

struct ComponentView {
  let component: Component
  @Binding var currentType: Component?
  @EnvironmentObject private var temps: Temps
}

extension ComponentView: View {
  var body: some View {
    HStack(spacing: 10) {
      Text(component.name + " Temp")
      Spacer()
      Text(component.current(temps).wrappedValue.tempDisplay)
    }
    .contentShape(Rectangle())
    .onTapGesture {
      currentType = component
    }
  }
}
