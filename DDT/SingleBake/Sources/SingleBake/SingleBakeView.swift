import SwiftUI
import AppInfo
import HelperViews

public struct SingleBakeView {
  @EnvironmentObject private var appStatus: AppStatus
  @State var isAddingMix: Bool = false
  @State private var isShowingSettings: Bool = false
  public init(){}
}

extension SingleBakeView: View {
  public var body: some View {
    NavigationView {
      ComponentsList()
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
        .navigationTitle("Temps \(appStatus.temperatureScaleIndicator)")
        .sheet(isPresented: $isAddingMix) {
          AddCurrentMixView(isAddingMix: $isAddingMix)
        }
        .sheet(isPresented: $isShowingSettings) {
          SettingsView(isShowingSettings: $isShowingSettings)
        }
    }
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

