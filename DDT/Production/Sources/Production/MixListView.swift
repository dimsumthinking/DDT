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
        ForEach(mixes) {mix in
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
  }
}



struct MixListView_Previews: PreviewProvider {
  static var previews: some View {
    MixListView()
  }
}
