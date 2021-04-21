import SwiftUI

struct ComponentView {
  let component: Component
  @Binding var currentType: Component?
  @EnvironmentObject private var temps: Temps
  @State private var temperature: Double = 50.0
}

extension ComponentView: View {
  var body: some View {
    VStack {
      HStack(spacing: 10) {
        Text(component.name + " Temp")
        Spacer()
        Text(temperature.tempDisplay)
      }
      .padding()
      
      if currentType == component {
        Slider(value: $temperature,
               in: component.range) {edited in
          if !edited {
            temps.record(temperature, for: component)
          }
        }
        .padding(.bottom)
        .transition(.slide)
        .animation(.default)
      }
    }
    .contentShape(Rectangle())
    .onTapGesture {
      if component != .water {
        currentType = component
      }
    }
    
  }
}
