import SwiftUI

struct TextButton {
  let text: String
  let action: () -> Void
}

extension TextButton: View {
  var body: some View {
    Button(text,
           action: action)
  }
}

struct TextButton_Previews: PreviewProvider {
  static var previews: some View {
    TextButton(text: "Sample",
               action: {})
  }
}
