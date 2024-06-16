import SwiftUI
import SingleBake
import Production
import Persistence
import SwiftData

@MainActor
struct MainView {
  @Environment(\.modelContext) private var modelContext
  @Query private var mixes: [Mix]
}

extension MainView: View {
  var body: some View {
    TabView {
      SingleBakeView()
      MixListView()
    }
//    .onOpenURL {url in  --> in MixListView
//      Mix.createMix(from: url,
//                    existingMixes: mixes,
//                    context: modelContext)
//    }
  }
}

import Components

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
