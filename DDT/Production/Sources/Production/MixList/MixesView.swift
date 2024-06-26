import SwiftUI
import Persistence

struct MixesView: View {
  @Environment(\.modelContext) private var modelContext
  var mixes: [Mix]
}

extension MixesView {
  var body: some View {
    List {
      ForEach(mixes) {mix in
        NavigationLink(value: mix) {
          MixListItemView(mix: mix)
        }
      }
      .onDelete { indexSet in
        if let index = indexSet.first {
          modelContext.delete(mixes[index])
        }
      }
    }
    .navigationDestination(for: Mix.self) {mix in
      MixView(mix: mix)
    }
  }
}

#Preview() {
  MixesView(mixes: Mix.sampleMixes)
}


