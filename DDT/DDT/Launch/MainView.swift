import SwiftUI
import Modes

struct MainView {
  @AppStorage("Mode") private var mode: Mode = .singleBake
  @State private var toolbarType: ToolbarType?
}

extension MainView: View {
  var body: some View {
    NavigationView {
      Text("Placeholder")
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarLeading) {
            Button {toolbarType = .modes}
          label: {Image(systemName: "plus.forwardslash.minus")}
          }
          //          .toolbar {
          //            ToolbarItemGroup(placement: .bottomBar) {
          //              Button {self.toolbarType = .help}
          //                label: {Image(systemName: "info.circle")}
          //              Spacer()
          //              Button {self.toolbarType = .settings}
          //                label: {Image(systemName: "gear")}
          //            }
        }
        .sheet(item: $toolbarType) {toolbarType in
          switch toolbarType {
          case .modes:
            ModePicker(dismissPicker: dismissSheet)
          default:
            Text("Temp")
        }
        }
    }
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
