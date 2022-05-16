import SwiftUI
//import MixModel

@main
struct DDTApp {
}

extension DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
//        .environmentObject(Status())
//        .environment(\.managedObjectContext,
//                     sharedViewContext)
    }
  }
}
