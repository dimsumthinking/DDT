import SwiftUI

public struct ListButtonStyle: ButtonStyle {
  public func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label
        .foregroundColor(.accentColor)
      Spacer()
    }
  }
  
  public init() {}
}

#Preview {
  Button("Sample", action: {})
    .buttonStyle(ListButtonStyle())
}
