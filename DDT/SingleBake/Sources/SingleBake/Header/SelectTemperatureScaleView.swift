import SwiftUI

struct SelectTemperatureScaleView: View {
  @State private var isShowingCorF: Bool = false
}

extension SelectTemperatureScaleView {
  var body: some View {
    HStack {
      Button("ºC / ºF") {
        isShowingCorF = true
      }
      Spacer()
    }
    .modifier(TemperatureScaleAlert(isShowingCorFAlert: $isShowingCorF))

  }
}

#Preview {
  SelectTemperatureScaleView()
}

