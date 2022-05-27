import SwiftUI
import AppInfo
import HelperViews

public struct SingleBakeView {
  @EnvironmentObject private var appStatus: AppStatus
  @State private var isAddingMix: Bool = false
  @State private var isShowingSettings: Bool = false
  @State private var isShowingHelp: Bool = false
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
              isAddingMix = false
              isShowingSettings = true
            }
          label: {Image(systemName: "gear")}
          }
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              isShowingSettings = false
              isAddingMix = true
            }
          label: {Image(systemName: "plus")}
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("DDT Calculator")
        .sheet(isPresented: $isAddingMix) {
          AddCurrentMixView(isAddingMix: $isAddingMix)
        }
        .sheet(isPresented: $isShowingSettings) {
          SettingsView(isShowingSettings: $isShowingSettings,
          isShowingHelp: $isShowingHelp)
        }
        .sheet(isPresented: $isShowingHelp) {
          HelpView(isShowingSettings: $isShowingSettings,
                   isShowingHelp: $isShowingHelp)
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

