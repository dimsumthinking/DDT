import SwiftUI
import Persistence

public struct MixNameView {
  @Binding var name: String
  let nameIsInUse: Bool
  
  public init(name: Binding<String>,
              nameIsInUse: Bool) {
    _name = name
    self.nameIsInUse = nameIsInUse
  }
}

extension MixNameView: View {
  public var body: some View {
    VStack {
      TextField("Name of Mix",
                text: $name)
      .multilineTextAlignment(.center)
      .listRowSeparator(.hidden)
      if nameIsInUse {
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
                nameIsInUse: false)
  }
}
