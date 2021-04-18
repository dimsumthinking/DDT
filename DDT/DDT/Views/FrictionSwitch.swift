import SwiftUI

struct FrictionSwitch {
  @Binding var autoFriction: Bool
}

extension FrictionSwitch: View {
  var body: some View {
    Toggle("Determine Friction Automatically",
           isOn: $autoFriction)
  }
}
