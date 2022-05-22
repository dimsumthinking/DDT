import SwiftUI

struct NameEntryView {
  @Binding var name: String
}

extension NameEntryView: View {
  var body: some View {
    TextField("Name of Mix",
              text: $name)
    .multilineTextAlignment(.center)
    .padding()
  }
}

struct NameEntryView_Previews: PreviewProvider {
  static var previews: some View {
    NameEntryView(name: .constant("Some name"))
  }
}
