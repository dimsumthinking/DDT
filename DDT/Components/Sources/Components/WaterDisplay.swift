import SwiftUI

public struct WaterDisplay {
   @ObservedObject private(set) var temperatures: ComponentTemperatures
  let hasPreferment: Bool
  let component = Component.water
  
  public init(_ temperatures: ComponentTemperatures,
              hasPreferment: Bool) {
    self.temperatures = temperatures
    self.hasPreferment = hasPreferment
  }
}

extension WaterDisplay: View {
  public var body: some View {
    HStack {
      Text(component.description)
      Spacer()
      FormattedTemperatureDisplay(formattedTemp: formattedTemperature)
    }
  }
}

extension WaterDisplay {
  private var formattedTemperature: (Bool) -> String {
    temperatures
      .waterTemperature(hasPreferment: hasPreferment)  .displayTemperature(for: component)
  }
}

struct WaterDisplay_Previews: PreviewProvider {
  static var previews: some View {
    WaterDisplay(ComponentTemperatures(ddt: 78,
                                       friction: 2),
                 hasPreferment: true)
    .padding(.horizontal)
  }
}
