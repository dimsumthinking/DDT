import SwiftUI
import SingleBake
import Production
import Persistence

struct MainView {
}

extension MainView: View {
  var body: some View {
    TabView {
      SingleBakeView()
      MixListView()
    }
    .onOpenURL {url in
      _ = Mix(url: url)
    }
  }
}

import Components

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
