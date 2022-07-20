import SwiftUI
import Persistence

struct MixNameView {
  @Binding var name: String
   let nameIsNotUnique: Bool
}

extension MixNameView: View {
  var body: some View {
    Section {
      TextField("Name of Mix",
                text: $name)
      .multilineTextAlignment(.center)
      .listRowSeparator(.hidden)
      if nameIsNotUnique {
        HStack {
          Spacer()
          Text("This mix name already exists")
            .font(.caption)
            .foregroundColor(.red)
          Spacer()
        }
      }
    }
  }
}

struct MixNameView_Previews: PreviewProvider {
  static var previews: some View {
    MixNameView(name: .constant("Sample"),
                nameIsNotUnique: false)
  }
}
