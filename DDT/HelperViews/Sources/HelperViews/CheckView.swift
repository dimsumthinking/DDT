import SwiftUI

public struct CheckView {
  private let name: String
  private let isChecked: Bool
  
  public init(name: String,
              isChecked: Bool) {
    self.name = name
    self.isChecked = isChecked
  }
}

extension CheckView: View {
  public var body: some View {
    HStack(spacing: 10) {
      Text(name)
      Spacer()
      if isChecked {
        Image(systemName: "checkmark")
          .foregroundColor(.green)
      } else {
        Image(systemName: "circle.slash")
          .foregroundColor(.red)
      }
    }
    .padding(.horizontal)
  }
}

struct CheckView_Previews: PreviewProvider {
  static var previews: some View {
    CheckView(name: "Preferment",
              isChecked: true)
  }
}
