import SwiftUI

struct SettingsView {
  @Binding var isShowingSettings: Bool
}

extension SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}

