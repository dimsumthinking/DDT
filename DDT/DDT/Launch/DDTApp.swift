import SwiftUI
import Utilities
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
      //        .environmentObject(Status())
      //        .environment(\.managedObjectContext,
      //                     sharedViewContext)
    }
  }
}
