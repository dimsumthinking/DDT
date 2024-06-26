import SwiftUI
import Persistence
import Components
import MixAddition
import SwiftData

public struct MixListView: View {
  @Query(sort: \Mix.lastUsed, order: .reverse) var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext
  @State private var isCreatingMix: Bool = false
  @State private var searchString: String = ""
  public init(){}
}

extension MixListView {
  public var body: some View {
    NavigationStack {
      if mixes.isEmpty {NoMixesView()}
      MixesView(mixes: filteredMixes)
      .navigationTitle("Production")
      .searchable(text: $searchString,
                  prompt: "Filter by name")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {isCreatingMix = true}) {
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $isCreatingMix) {
        NewMixView(isShowingSheet: $isCreatingMix)
      }
    }
    .navigationViewStyle(.stack)
    .tabItem {
      Label("Production",
            systemImage: "list.bullet.rectangle")
    }
    .onOpenURL {url in
      Mix.createMix(from: url,
                    existingMixes: mixes,
                    context: modelContext)
    }
  }
}

extension MixListView {
  private var filteredMixes: [Mix] {
    if searchString.isEmpty { mixes }
    else {
      mixes
        .filter {mix in
          mix.name.lowercased().contains(searchString.lowercased())
        }
    }
  }
}

#Preview(traits: .mixPreviewData) {
  MixListView()
}


