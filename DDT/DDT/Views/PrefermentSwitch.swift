import SwiftUI

struct PrefermentSwitch {
    @Binding var hasPreferment: Bool
}

extension PrefermentSwitch: View {
    var body: some View {
        Toggle("Preferment",
               isOn: $hasPreferment)
    }
}
