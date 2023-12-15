import SwiftUI
import Persistence
import Components


struct MixView {
  var mix: Mix
  @State private var finalDoughTemp: Double = Component.friction.defaultTemp
  @StateObject private var temperatures = ComponentTemperatures()
}

extension MixView: View {
  var body: some View {
    List {
      Section {
        WaterDisplay(temperatures,
                     hasPreferment: mix.hasPreferment)
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
//      mix.updateDate()
    }
    .navigationTitle(mix.name)
//    .toolbar {  //TODO: bring back
//      ToolbarItem(placement: .navigationBarTrailing) {
//        ShareLink(item: mix.url,
//        subject: Text("Formula shared from DDT app"),
//                  message: Text("Link to \(mix.name) DDT formula"))
//      }
//    }
  }
}

//Preview doesn't render
//struct MixView_Previews: PreviewProvider {
//  static var previews: some View {
//    MixView(mix: Mix(name: "Sample",
//                     desiredDoughTemperature: 76,
//                     frictionCoefficient: 2,
//                     hasPreferment: false,
//                     context: newBackgroundContext()))
//  }
//}
