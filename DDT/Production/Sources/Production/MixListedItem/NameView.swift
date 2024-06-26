import SwiftUI
import Persistence

struct NameView: View {
  @State private var notEditing = true
  @State private var name: String = ""
  var mix: Mix

}

extension NameView {
  var body: some View {
    Group {
      if notEditing {
        NameDisplayView(name: name)
          .onTapGesture { notEditing = false}
      } else {
        NameEditingView(mix: mix,
                        name: $name,
                        notEditing: $notEditing)
      }
    }
      .onAppear {
        name = mix.name
      }
      .animation(.default, value: notEditing)
  }
}

#Preview(traits: .mixPreviewData) {
  NameView(mix: Mix.sampleMix)
}
