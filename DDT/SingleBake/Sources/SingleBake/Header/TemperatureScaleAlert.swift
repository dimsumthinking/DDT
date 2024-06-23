import SwiftUI

struct TemperatureScaleAlert {
  @Binding var isShowingCorFAlert: Bool
  @AppStorage("isCelsius") private var isCelsius: Bool = false
}

extension TemperatureScaleAlert: ViewModifier {
  func body(content: Content) -> some View {
    content
      .alert("Temperature Scale",
             isPresented: $isShowingCorFAlert) {
        Button("Celsius") {
          isCelsius = true
          isShowingCorFAlert = false
        }
        Button("Fahrenheit") {
          isCelsius = false
          isShowingCorFAlert = false
        }
      }
  }
}

#Preview {
  @Previewable
  @State var isShowingCorFAlert = true
  Text("Sample")
    .modifier(TemperatureScaleAlert(isShowingCorFAlert: $isShowingCorFAlert))
}

