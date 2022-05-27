import SwiftUI
import SingleBake
import Production
import AppInfo
import HelperViews

struct MainView {
}

extension MainView: View {
  var body: some View {
    TabView {
      SingleBakeView()
        .tabItem {
          LabelForTabType(.singleBake)
        }
      MixListView()
        .tabItem {
          LabelForTabType(.production)
        }
    }
  }
}

import Components

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(AppStatus(isCelsius: true))
      .environmentObject(ComponentValues())
  }
}
