import SwiftUI
import Persistence
import Components
import MixAddition

public struct MixListView {
  @FetchRequest(entity: Mix.entity(),
                sortDescriptors: [NSSortDescriptor(key: "lastUsed",
                                                   ascending: false)])
  private var mixes: FetchedResults<Mix>
  @State private var isCreatingMix: Bool = false
  @State private var searchString: String = ""
  public init(){}
}

extension MixListView: View {
  public var body: some View {
    NavigationStack {
      if mixes.isEmpty {
        Text("No saved mixes")
          .foregroundColor(.secondary)
          .padding()
      }
      List {
        ForEach(filteredMixes) {mix in
          NavigationLink(value: mix) {
            MixListItemView(mix: mix)
          }
        }
        .onDelete { indexSet in
          if let index = indexSet.first {
            sharedViewContext.delete(mixes[index])
            try? sharedViewContext.save()
          }
        }
      }
      .navigationDestination(for: Mix.self) {mix in
        MixView(mix: mix)
      }
      .navigationTitle("Production")
      .searchable(text: $searchString,
                  prompt: "Filter by name")
#if os(iOS)
      .navigationBarTitleDisplayMode(.inline)
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
#endif
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
      _ = Mix(url: url)
    }
  }
}

extension MixListView {
  private var filteredMixes: [Mix] {
    if searchString.isEmpty {
      return mixes.map{$0}
    } else {
      return mixes
        .filter {mix in
        mix.name.lowercased().contains(searchString.lowercased())
      }
    }
  }
}



struct MixListView_Previews: PreviewProvider {
  static var previews: some View {
    MixListView()
  }
}
