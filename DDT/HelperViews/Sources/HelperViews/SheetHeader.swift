import SwiftUI

public struct SheetHeader {
  private let text: String
  public init(text: String) {
    self.text = text
  }
}

extension SheetHeader: View {
  public var body: some View {
    HStack {
      Spacer()
      Text(text)
        .font(.largeTitle)
      Spacer()
    }  }
}

struct SheetHeader_Previews: PreviewProvider {
  static var previews: some View {
    SheetHeader(text: "Sample")
  }
}
