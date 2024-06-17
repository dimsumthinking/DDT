import SwiftUI
import Components
import Persistence


struct FinalDoughTempView {
  let mix: Mix
  @Binding var finalDoughTemp: Double
  @Environment(\.modelContext) private var modelContext
}

extension FinalDoughTempView: View {
  var body: some View {
    Section ("To update Friction Coefficient:") {
      VStack {
        TemperatureDisplay(finalDoughTemp,
                           for: Ingredient.final)
        Slider(value: $finalDoughTemp,
               in: Ingredient.final.range)
      }
      .padding(.vertical)
      TemperatureDisplay(adjustedFriction,
                         for: .friction)
    }
    .onAppear {
      finalDoughTemp = Ingredient.ddt.defaultTemp
    }
    .onDisappear {
      mix.frictionCoefficient = adjustedFriction
      do {
        try modelContext.save()
      } catch {
        print("Unable to save friction coefficient")
      }
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

