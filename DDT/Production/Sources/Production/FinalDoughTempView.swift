import SwiftUI
import Components
import HelperViews
import Persistence
import AppInfo


struct FinalDoughTempView {
  let ddt: Double
  let friction: Double
  let mix: Mix
  @Binding var finalDoughTemp: Double
}

extension FinalDoughTempView: View {
  var body: some View {
    VStack {
      TempView(name: "Final Dough Temp",
               temp: finalDoughTemp,
               isFriction: false)
      .padding(.top)
      Slider(value: $finalDoughTemp,
             in: defaultFinalRange){isActive in
        if !isActive {
          mix.update(frictionCoefficient: adjustedFriction)
        }
      }
      .padding(.bottom)
      TempView(name: "Adjusted Friction",
               temp: adjustedFriction,
               isFriction: false)
      
    }
    .onAppear {
      finalDoughTemp = defaultComponentsTemp
    }
  }
}


extension FinalDoughTempView {
  private var adjustedFriction: Double {
    let frictionCandidate = friction + (finalDoughTemp - ddt)
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
    FinalDoughTempView(ddt: 76,
                       friction: 20,
                       mix: Mix(name: "Test",
                                desiredDoughTemperature: 80,
                                frictionCoefficient: 24,
                                hasPreferment: true,
                                context: sharedViewContext),
                       finalDoughTemp: .constant(80))
  }
}

