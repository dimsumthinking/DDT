import SwiftUI
import Persistence

@main
struct DDTApp {
}

extension DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environment(\.managedObjectContext, sharedViewContext)
    }
  }
}
