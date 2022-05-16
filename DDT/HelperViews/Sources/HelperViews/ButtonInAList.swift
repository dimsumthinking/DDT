import SwiftUI

public struct ButtonInAList {
  private let text: String
  private let action: () -> Void
  
  public init(text: String,
              action: @escaping () -> Void) {
    self.text = text
    self.action = action
  }
}

extension ButtonInAList: View {
  public var body: some View {
    HStack {
      Spacer()
      
      Button(text,
             action: action)
        .padding()
      Spacer()
    }
  }
}

struct ButtonInAList_Previews: PreviewProvider {
  static var previews: some View {
    ButtonInAList(text: "Placeholder",
                  action: {})
  }
}
