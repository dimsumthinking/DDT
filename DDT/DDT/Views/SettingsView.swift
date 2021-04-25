import SwiftUI

struct SettingsView {
  @Binding var toolbarType: ToolbarType?
  @Binding var friction: Double
  @State private var isShowingFrictionHelp = false
  @Binding var isCelsius: Bool
  let convertTempScale: () -> Void
}

extension SettingsView: View {
  var body: some View {
    ScrollView {
    VStack {
        Text("Settings").font(.title).padding()
      VStack(spacing: 20) {
        HStack {
          Text("Temperature scale:")
          Spacer()
        }
        HStack {
          Spacer()
          Button {
            isCelsius = false
            convertTempScale()
          } label: {
            Text("Fahrenheit")
              .foregroundColor(isCelsius ? .secondary : .red)
          }
          Spacer()
          Button {
            isCelsius = true
            convertTempScale()
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
        ComponentView(name: "Friction",
                      temp: $friction,
                      range: frictionRange(inCelsius: isCelsius))
        if isShowingFrictionHelp {
          Text("""
                  To tune the friction factor, measure the actual dough temperature. \n
                  If the actual dough temperature is higher than the desired dough temperature:\n
                  \t increase the friction by that amount to compensate next time. \n
                  If the actual dough temperature is lower than the desired dough temperature:\n
                  \t reduce the friction by that amount to compensate next time.\n
                  After a couple of bakes, your friction factor should be close enough.\n
                  A good starting point is around 24ºF/13ºC for machine mixing and 2ºF/1ºC for hand mixing.\n
                  Use the buttons to set the friction to these amounts.
                  """)
        }
        Text("Reset using defaults:")
        HStack {
          Spacer()
          Button {
            friction = defaultFriction(inCelsius: isCelsius)
          } label: {
            Text("Machine Mix")
          }
          Spacer()
          Button {
            friction = defaultHandFriction(inCelsius: isCelsius)
          } label: {
            Text("Hand Mix")
          }
          Spacer()
        }
      }
      .padding()
      .border(Color.secondary, width: 1)
      .padding()
      Button {
        toolbarType = nil
      } label: {
        Text("Dismiss")
      }
    }
    .padding()
    }
  }
}
