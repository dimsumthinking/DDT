import SwiftUI
import Components
import Persistence


struct FinalDoughTempView {
  let ddt: Double
  let friction: Double
  let mix: Mix
  @Binding var finalDoughTemp: Double
}

//TODO: Replace hard-coded final dough range 40 ...120 and hard coded temp
extension FinalDoughTempView: View {
  var body: some View {
    VStack {
      ComponentView(.final,
                    temperature: $finalDoughTemp)
      .padding(.top)
      Slider(value: $finalDoughTemp,
             in: 40 ... 120){isActive in
        if !isActive {
          mix.update(frictionCoefficient: adjustedFriction)
        }
      }
      .padding(.bottom)
      
    }
    .onAppear {
      finalDoughTemp = Component.ddt.defaultTemp
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
    FinalDoughTempView(ddt: Component.ddt.defaultTemp,
                       friction: 20,
                       mix: Mix(name: "Test",
                                desiredDoughTemperature: 80,
                                frictionCoefficient: 24,
                                hasPreferment: true,
                                context: sharedViewContext),
                       finalDoughTemp: .constant(80))
  }
}

