import SwiftUI

@main
struct DDTApp: App {
    var body: some Scene {
        WindowGroup {
          MainView().environmentObject(Temps())
        }
    }
}
