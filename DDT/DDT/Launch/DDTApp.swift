import SwiftUI
import AppInfo
import Components
//import MixModel

@main
struct DDTApp {
  @AppStorage("isCelsius") private var isCelsius: Bool = false
}

extension DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(AppStatus(isCelsius: isCelsius))
        .environmentObject(ComponentValues())
      //        .environmentObject(Status())
      //        .environment(\.managedObjectContext,
      //                     sharedViewContext)
    }
  }
}
