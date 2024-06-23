import SwiftUI

struct SelectTemperatureScaleView: View {
  @State private var isShowingCorF: Bool = false
}

extension SelectTemperatureScaleView {
  var body: some View {
    Button("ºC / ºF") {
      isShowingCorF = true
    }
    .modifier(TemperatureScaleAlert(isShowingCorFAlert: $isShowingCorF))
    
  }
}

#Preview {
  SelectTemperatureScaleView()
}

