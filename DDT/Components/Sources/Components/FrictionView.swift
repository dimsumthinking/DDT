import SwiftUI
import AppInfo

public struct FrictionView {
  @State private var temp: Double = 0
  @AppStorage("FrictionCoefficient") var friction = defaultMixerFrictionTemp
  @EnvironmentObject private var componentValues: ComponentValues
  @EnvironmentObject private var appStatus: AppStatus
  public init(){}
}

extension FrictionView: View {
  public var body: some View {
    VStack(spacing: 20) {
      
    ComponentView(for: .friction,
                  temp:  $temp)
    .onChange(of: temp) {temp in
      friction = temp
    }
      Text("Start with \(appStatus.defaultHandMix)\(appStatus.temperatureScaleIndicator) for hand mixing")
           Text("and \(appStatus.defaultMachineMix)\(appStatus.temperatureScaleIndicator) for machine mixing")
    .padding(.bottom)
    }
  }
}


struct FrictionView_Previews: PreviewProvider {
  static var previews: some View {
    FrictionView()
      .environmentObject(ComponentValues())
  }
}

