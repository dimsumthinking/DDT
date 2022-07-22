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
    NavigationView {
      List {
        ForEach(mixes) {mix in
          NavigationLink {
            MixView(mix: mix)
          } label: {
              MixListItemView(mix: mix)
                .contentShape(Rectangle())
          }
        }
        .onDelete { indexSet in
          if let index = indexSet.first {
            sharedViewContext.delete(mixes[index])
            try? sharedViewContext.save()
          }
        }
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
      .sheet(isPresented: $isCreatingMix) {
        NewMixView(isShowingSheet: $isCreatingMix)
      }
      #endif
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
