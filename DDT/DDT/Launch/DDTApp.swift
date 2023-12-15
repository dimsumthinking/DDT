import SwiftUI
import Persistence
import SwiftData

@main
struct DDTApp {
}

extension DDTApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .modelContainer(for: Mix.self)
    }
  }
}
