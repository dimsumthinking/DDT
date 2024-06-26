import SwiftUI

struct NameDisplayView: View {
  let name: String
}

extension NameDisplayView {
  var body: some View {
    Text(name)
      .padding(.bottom)
      .contentShape(Rectangle())
  }
}

#Preview {
  NameDisplayView(name: "Sour Dough")
}


