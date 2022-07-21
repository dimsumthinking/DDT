import SwiftUI

struct ListButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label
        .foregroundColor(.accentColor)
      Spacer()
    }
  }
}
