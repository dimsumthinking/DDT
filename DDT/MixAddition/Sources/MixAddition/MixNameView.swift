import SwiftUI
import Persistence

public struct MixNameView: View {
  @Binding var name: String
  let nameIsInUse: Bool
  
  
  public init(name: Binding<String>,
              nameIsInUse: Bool) {
    _name = name
    self.nameIsInUse = nameIsInUse
  }
}

extension MixNameView {
  public var body: some View {
    VStack {
        HStack {
          Spacer()
          if nameIsInUse {
            Text("This mix name already exists")
              .font(.caption)
              .foregroundColor(.red)
          } else {
            Text("Unique name at least 4 letters long:")
              .font(.caption)
              .foregroundColor(.secondary)
          }
          Spacer()
        }
      TextField("Name of Mix",
                text: $name)
      .foregroundColor(nameIsInUse ? .red : .primary)
      .multilineTextAlignment(.center)
      .background(Color.secondary.opacity(0.1))
      }
  }
}

#Preview {
  @Previewable
  @State var name = "Sample"
  MixNameView(name: $name,
              nameIsInUse: false)
}

