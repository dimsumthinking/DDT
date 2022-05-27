import SwiftUI
import AppInfo
import Components
import HelperViews

struct SettingsView {
  @Binding var isShowingSettings: Bool
  @AppStorage("isCelsius") private var isCelsius: Bool = false
  @AppStorage("showFrictionSingleBake") private var showFrictionSingleBake: Bool = false
  @AppStorage("showFrictionTuning") private var showFrictionTuning: Bool = true
  @EnvironmentObject private var appStatus: AppStatus
  @EnvironmentObject private var componentValues: ComponentValues
  @Binding var isShowingHelp: Bool
}

extension SettingsView: View {
  var body: some View {
    ScrollView {
    VStack {
        Text("Settings")
        .font(.title)
        .padding()
      SettingsItemView(heading: "Temperature Scale:",
                       toggleAction: appStatus.toggleTemperatureScale,
                       onText: "Celsius",
                       offText: "Fahrenheit",
                       toggleResult: $isCelsius)
      
      SettingsItemView(heading: "Friction in Single Bake:",
                       toggleAction: appStatus.toggleShowFrictionSingleBake,
                       onText: "Visible",
                       offText: "Hidden",
                       toggleResult: $showFrictionSingleBake)
      
      SettingsItemView(heading: "Friction Tuning in Production:",
                       toggleAction: appStatus.toggleShowFrictionTuning,
                       onText: "Visible",
                       offText: "Hidden",
                       toggleResult: $showFrictionTuning)
      HStack {
        Spacer()
      Button("Show Info",
                    action: {
        isShowingSettings = false
        isShowingHelp = true
      })
      Spacer()
      Button(action: {isShowingSettings = false}) {
        Text("Dismiss")
      }
        Spacer()
    }
      .padding(.top)
    }
    .padding()
    }
  }
}
