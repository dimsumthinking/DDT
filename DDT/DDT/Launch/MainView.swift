import SwiftUI
import Modes
import Utilities

struct MainView {
  @AppStorage("Mode") private var mode: Mode = .singleBake
  @State private var toolbarType: ToolbarType?
}

extension MainView: View {
  var body: some View {
    NavigationView {
      Group {
        switch mode {
        case .singleBake:
          ClassicView()
//          SingleBakeView()
        default:
          Text("Placeholder")
        }
      }
      .navigationTitle(mode.description)
      .navigationBarTitleDisplayMode(.inline)
//      .navigationViewStyle(.stack)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button {toolbarType = .modes}
        label: {Image(systemName: "plus.forwardslash.minus")}
        }
      }
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button {toolbarType = .help}
        label: {Image(systemName: "info.circle")}
          Spacer()
          Button {toolbarType = .settings}
        label: {Image(systemName: "gear")}
        }
      }
      .sheet(item: $toolbarType) {toolbarType in
        switch toolbarType {
        case .modes:
          ModePicker(dismiss: dismissSheet)
        case .help:
          HelpView(dismiss: dismissSheet)
        case .settings:
          SettingsView(dismiss: dismissSheet)
        }
      }
    }
    .navigationViewStyle(.stack)

  }
}

extension MainView {
  private func dismissSheet() {
    toolbarType = nil
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
