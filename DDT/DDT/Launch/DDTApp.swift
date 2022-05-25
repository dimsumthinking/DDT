import SwiftUI
import AppInfo
import Components
import Persistence

@main
struct DDTApp {
  @AppStorage("isCelsius") private var isCelsius: Bool = false
  @AppStorage("showFrictionSingleBake") private var showFrictionSingleBake: Bool = false
  @AppStorage("showFrictionTuning") private var showFrictionTuning: Bool = true
}

extension DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(AppStatus(isCelsius: isCelsius,
                                    showFrictionSingleBake: showFrictionSingleBake,
                                    showFrictionTuning: showFrictionTuning))
        .environmentObject(ComponentValues())
        .environment(\.managedObjectContext, sharedViewContext)
    }
  }
}
