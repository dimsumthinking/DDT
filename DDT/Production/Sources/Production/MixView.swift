import SwiftUI
import Persistence
import Components


struct MixView {
  @ObservedObject var mix: Mix
  @EnvironmentObject private var componentValues: ComponentValues
  @State private var finalDoughTemp: Double = Component.friction.defaultTemp
  @State private var temperatures: ComponentTemperatures
  
  init(mix: Mix) {
    self.mix = mix
    temperatures = ComponentTemperatures(ddt: mix.desiredDoughTemperature,
                                         friction: mix.frictionCoefficient)
  }
}

extension MixView: View {
  var body: some View {
    List {
      Section {
        TemperatureDisplay(temperatures.waterTemperature(hasPreferment: mix.hasPreferment),
                           for: .water)
      }
      Section {
        TemperatureDisplay(mix.desiredDoughTemperature,
                           for: .ddt)
        ComponentView(.ambient,
                      temperature: $temperatures.ambient)
        ComponentView(.flour,
                      temperature: $temperatures.flour)
        if mix.hasPreferment {
          ComponentView(.preferment,
                        temperature: $temperatures.preferment)
        }
      }
      
      Section ("To update Friction Coefficient:") {
        FinalDoughTempView(ddt: componentValues.ddt,
                           friction: componentValues.friction,
                           mix: mix,
                           finalDoughTemp: $finalDoughTemp)
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
