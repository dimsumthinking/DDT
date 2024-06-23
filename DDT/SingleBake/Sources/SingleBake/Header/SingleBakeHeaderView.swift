import SwiftUI
import Components

struct SingleBakeHeaderView: View {
  @State private var temperatures = IngredientTemperature()
}

extension SingleBakeHeaderView {
  var body: some View {
    ZStack {
      SelectTemperatureScaleView()
      Text("DDT Calculator")
      AddMixView(temperatures: temperatures)
    }
    .padding(.horizontal)
  }
}

#Preview {
  SingleBakeHeaderView()
}
