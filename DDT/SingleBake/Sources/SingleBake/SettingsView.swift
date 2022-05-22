import SwiftUI
import AppInfo
import Components

struct SettingsView {
  @Binding var isShowingSettings: Bool
  @AppStorage("isCelsius") private var isCelsius: Bool = false
  @EnvironmentObject private var appStatus: AppStatus
  @EnvironmentObject private var componentValues: ComponentValues
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
            isCelsius = appStatus.toggleTemperatureScale()
          } label: {
            Text("Fahrenheit")
              .foregroundColor(isCelsius ? .secondary : .red)
          }
          Spacer()
          Button {
            isCelsius = appStatus.toggleTemperatureScale()
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
      FrictionView()
      .padding()
      .border(Color.secondary, width: 1)
      .padding()
      Button(action: {isShowingSettings = false}) {
        Text("Dismiss")
      }
    }
    .padding()
    }
  }
}
