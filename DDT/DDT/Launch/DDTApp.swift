import SwiftUI
import MixModel

@main
struct DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environment(\.managedObjectContext,
                     sharedViewContext)
    }
  }
}
