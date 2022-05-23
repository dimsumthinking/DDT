import SwiftUI
import SingleBake
import Production
import AppInfo

struct MainView {
}

extension MainView: View {
  var body: some View {
    TabView {
      SingleBakeView()
        .tabItem {
          Label("Single Bake",
                systemImage: "slider.horizontal.3")
        }
      MixListView()
        .tabItem {
          Label("Production",
                systemImage: "list.bullet.rectangle")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(AppStatus(isCelsius: true))
  }
}
