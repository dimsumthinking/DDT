import SwiftUI

public struct NameEntryView {
  @Binding var name: String
  public init(name: Binding<String>) {
    self._name = name
  }
}

extension NameEntryView: View {
  public var body: some View {
    TextField("Name of Mix",
              text: $name)
    .multilineTextAlignment(.center)
//    .padding()
  }
}

struct NameEntryView_Previews: PreviewProvider {
  static var previews: some View {
    NameEntryView(name: .constant("Some name"))
  }
}
