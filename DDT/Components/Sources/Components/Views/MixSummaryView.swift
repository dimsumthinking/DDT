import SwiftUI

public struct MixSummaryView: View {
  let ddt: Temperature
  let frictionCoefficient: Temperature
  let hasPreferment: Bool
  
  public init(ddt: Temperature,
              frictionCoefficient: Temperature,
              hasPreferment: Bool) {
    self.ddt = ddt
    self.frictionCoefficient = frictionCoefficient
    self.hasPreferment = hasPreferment
  }
  
}

extension MixSummaryView {
  public var body: some View {
    HStack {
      MiniTemperatureDisplay(temperature: ddt,
                             ingredient: .ddt)
      Spacer()
      MiniTemperatureDisplay(temperature: frictionCoefficient,
                             ingredient: .friction)
      Spacer()
      Text("PF")
        .foregroundColor(hasPreferment ? .secondary : .clear)
      Spacer()
    }
  }
}

#Preview {
  MixSummaryView(ddt: 80,
                 frictionCoefficient: 2,
                 hasPreferment: true)
}
