import SwiftUI


struct AddCurrentMixView {
  @Binding var isAddingMix: Bool
}

extension AddCurrentMixView: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct AddCurrentMixView_Previews: PreviewProvider {
  static var previews: some View {
    AddCurrentMixView(isAddingMix: .constant(true))
  }
}
