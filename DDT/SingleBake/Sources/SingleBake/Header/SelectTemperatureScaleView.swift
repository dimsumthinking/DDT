import SwiftUI

struct SelectTemperatureScaleView: View {
  @AppStorage("isCelsius") private var isCelsius: Bool = false
}

extension SelectTemperatureScaleView {
  var body: some View {
    Button {
      isCelsius.toggle()
    } label: {
      isCelsius ? Text("ºF") : Text("ºC")
    }
  }
}

#Preview {
  SelectTemperatureScaleView()
}

