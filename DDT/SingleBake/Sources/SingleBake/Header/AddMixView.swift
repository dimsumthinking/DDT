import SwiftUI
import MixAddition
import Components

struct AddMixView: View {
  @State private var isAddingMix: Bool = false
  let temperatures: IngredientTemperature
}

extension AddMixView {
  var body: some View {
    Button {
      isAddingMix = true
    }
    label: {Image(systemName: "plus")}
      .sheet(isPresented: $isAddingMix) {
        NewMixView(temperatures: temperatures,
                   isShowingSheet: $isAddingMix)
      }
  }
}


#Preview {
  AddMixView(temperatures: IngredientTemperature())
}


