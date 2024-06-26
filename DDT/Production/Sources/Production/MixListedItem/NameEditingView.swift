import SwiftUI
import Persistence
import MixAddition
import SwiftData

struct NameEditingView: View {
  var mix: Mix
  @State private var nameIsInUse = false
  @Binding var name: String
  @Binding var notEditing: Bool
  @Query var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext
}

extension NameEditingView {
  var body: some View {
    MixNameView(name: $name,
                nameIsInUse: nameIsInUse)
    .onSubmit {
      if nameIsInUse || name.count < 5 {
        name = mix.name
      } else {
        mix.name = name
        do {
          try modelContext.save()
        } catch {
          print("Could not save new name \(name)")
        }
      }
      notEditing = true
    }
    .onChange(of: name) {oldValue, newValue in
      nameIsInUse = mixes.filter{$0 != mix}.map(\.name).contains(newValue)
    }
    .onDisappear {notEditing = true}
  }
}

#Preview(traits: .mixPreviewData) {
  @Previewable
  @State var name = "Some Dough"
  @Previewable
  @State var notEditing = false
  NameEditingView(mix: Mix.sampleMix,
                  name: $name, 
                  notEditing: $notEditing)
}

