import SwiftUI

struct SettingsView {
  @Binding var isShowingSettings: Bool
  @Binding var friction: Double
  @State private var isShowingFrictionHelp = false
  @Binding var isCelsius: Bool
}

extension SettingsView: View {
  var body: some View {
    VStack(spacing: 20) {
        Text("Settings").font(.title).padding()
      VStack(spacing: 20) {
        HStack {
          Text("Temperature scale:").foregroundColor(.secondary)
          Spacer()
        }
        HStack {
          Spacer()
          Button {
            isCelsius = false
          } label: {
            Text("Fahrenheit")
              .foregroundColor(isCelsius ? .secondary : .red)
          }
          Spacer()
          Button {
            isCelsius = true
          } label: {
            Text("Celsius")
              .foregroundColor(isCelsius ? .red : .secondary)
          }
          Spacer()
        }
      }
      .padding()
      .border(Color.secondary, width: 1)
      .padding()
      VStack(spacing: 20) {
        HStack {
          Text("Friction Factor:")
          Spacer()
          Button {self.isShowingFrictionHelp.toggle()}
            label: {Image(systemName: "questionmark")}
        }
        if isShowingFrictionHelp {
          Text("""
                  To tune the friction factor, measure the
                  actual dough temperature. \n
                  If the actual dough temperature is higher
                  than the desired dough temperature, increase
                  the friction by that amount to compensate
                  next time. \n
                  If the actual dough temperature is lower,
                  decrease the friction by that amount to
                  compensate next time.\n
                  After a couple of bakes, your friction factor
                  should be close enough.
                  """)
        }
        ComponentView(name: "Friction",
                      temp: $friction,
                      range: frictionRange(inCelsius: isCelsius))
      }
      .padding()
      .border(Color.secondary, width: 1)
      .padding()
      Button {
        isShowingSettings = false
      } label: {
        Text("Dismiss")
      }
    }
    .padding()
  }
}
