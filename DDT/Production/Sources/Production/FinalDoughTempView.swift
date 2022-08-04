import SwiftUI
import Components
import Persistence


struct FinalDoughTempView {
  let mix: Mix
  @Binding var finalDoughTemp: Double
}

extension FinalDoughTempView: View {
  var body: some View {
    Section ("To update Friction Coefficient:") {
      ComponentView(.final,
                    temperature: $finalDoughTemp)
      .padding(.vertical)
      TemperatureDisplay(adjustedFriction,
                         for: .friction)
    }
    .onAppear {
      finalDoughTemp = Component.ddt.defaultTemp
    }
    .onDisappear {
      mix.update(frictionCoefficient: adjustedFriction)
    }
  }
}


extension FinalDoughTempView {
  private var adjustedFriction: Double {
    let frictionCandidate = mix.frictionCoefficient + (finalDoughTemp - mix.desiredDoughTemperature)
    switch frictionCandidate {
    case ...0:
      return 0
    case 40...:
      return 40
    default:
      return frictionCandidate
    }
  }
}

struct FinalDoughTempView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      FinalDoughTempView(mix: Mix(name: "Test",
                                  desiredDoughTemperature: 80,
                                  frictionCoefficient: 24,
                                  hasPreferment: true,
                                  context: sharedViewContext),
                         finalDoughTemp: .constant(80))
    }
  }
}

