import SwiftUI
import Persistence
import Components
import HelperViews
import AppInfo

struct MixView {
  @ObservedObject var mix: Mix
  @EnvironmentObject private var componentValues: ComponentValues
  @EnvironmentObject private var appStatus: AppStatus
  @State private var finalDoughTemp: Double = defaultComponentsTemp
}

extension MixView: View {
  var body: some View {
    List {
      Section {
        WaterView()
      }
      Section {
        TempView(name: ComponentType.ddt.description,
                 temp: componentValues.ddt)
        AdjustableComponentView(type: .ambient)
        AdjustableComponentView(type: .flour)
        if componentValues.hasPreferment {
          AdjustableComponentView(type: .preferment)
        }
      }
      if appStatus.showFrictionTuning {
      Section ("To update Friction Coefficient:") {
        FinalDoughTempView(ddt: componentValues.ddt,
                           friction: componentValues.friction,
                           mix: mix,
                           finalDoughTemp: $finalDoughTemp)
      }
      }
    }
#if os(iOS)
    .listStyle(.insetGrouped)
#endif
    .onAppear {
      componentValues.ddt = mix.desiredDoughTemperature
      componentValues.friction = mix.frictionCoefficient
      componentValues.hasPreferment = mix.hasPreferment
      mix.updateDate()
    }
    .navigationTitle(mix.name)
  }
}

//struct MixView_Previews: PreviewProvider {
//  static var previews: some View {
//    MixView()
//  }
//}
