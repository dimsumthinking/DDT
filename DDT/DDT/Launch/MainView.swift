import SwiftUI
import SingleBake
import Production

struct MainView {
}

extension MainView: View {
  var body: some View {
    TabView {
      SingleBakeView()
      MixListView()
    }
  }
}

import Components

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
//      .environmentObject(AppStatus(isCelsius: true))
      .environmentObject(ComponentValues())
  }
}
