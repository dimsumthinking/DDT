import SwiftUI
import Persistence
import Components


struct MixView {
  @ObservedObject var mix: Mix
  @State private var finalDoughTemp: Double = Component.friction.defaultTemp
  @StateObject private var temperatures = ComponentTemperatures()
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
      FinalDoughTempView(mix: mix,
                         finalDoughTemp: $finalDoughTemp)
      
    }
    .onAppear {
      temperatures.ddt = mix.desiredDoughTemperature
      temperatures.friction = mix.frictionCoefficient
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
