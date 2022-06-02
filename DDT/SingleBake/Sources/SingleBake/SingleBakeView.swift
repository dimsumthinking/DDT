import SwiftUI
import AppInfo
import HelperViews

public struct SingleBakeView {
  @EnvironmentObject private var appStatus: AppStatus
  @State private var isAddingMix: Bool = false
  @State private var isShowingSettings: Bool = false
  @State private var isShowingHelp: Bool = false
  @State private var singleBakeDisplayedSheet: SingleBakeDisplayedSheet? = nil
  public init(){}
}

extension SingleBakeView: View {
  public var body: some View {
    NavigationView {
      ComponentsList()
#if os(iOS)
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarLeading) {
            Button {
              singleBakeDisplayedSheet = .settings
            }
          label: {Image(systemName: "gear")}
          }
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              singleBakeDisplayedSheet = .addMix
            }
          label: {Image(systemName: "plus")}
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("DDT Calculator")
        .sheet(item: $singleBakeDisplayedSheet) {item in
            switch item {
            case .settings:
              SettingsView(singleBakeDisplayedSheet: $singleBakeDisplayedSheet)
            case .help:
              HelpView(singleBakeDisplayedSheet: $singleBakeDisplayedSheet)
            case .addMix:
              AddCurrentMixView(singleBakeDisplayedSheet: $singleBakeDisplayedSheet)
          }
        }
#endif
    }
    .navigationViewStyle(.stack)
  }
}

//import Components

struct SingleBakeView_Previews: PreviewProvider {
  static var previews: some View {
    SingleBakeView()
      .environmentObject(AppStatus())
    //      .environmentObject(ComponentValues())
  }
}

