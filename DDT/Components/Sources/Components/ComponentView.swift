import SwiftUI

public struct ComponentView {
  let component: Component
  @Binding var temperature: Temperature
  
  public init(_ component: Component,
              temperature: Binding<Temperature>) {
    self.component = component
    self._temperature = temperature
  }
}

extension ComponentView: View {
  public var body: some View {
    VStack {
      TemperatureDisplay(temperature,
                         for: component)
      Slider(value: $temperature,
             in: component.range)
    }
  }
}

struct ComponentView_Previews: PreviewProvider {
  static var previews: some View {
    ComponentView(.flour,
                  temperature: .constant(76))
  }
}
