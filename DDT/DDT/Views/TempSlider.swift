import SwiftUI

struct TempSlider {
  let component: Component
  @EnvironmentObject private var temps: Temps
}

extension TempSlider: View {
  var body: some View {
    VStack {
      Text(component.name
            + " Temp:\t"
            + component.current(temps).wrappedValue.tempDisplay)
      Slider(value: tempBinding,
             in: component.range){ _ in
        temps.updater.toggle()}
      .padding(.horizontal)
//      Text(component.name)
//        .padding(.top)

    }
  }
}

extension TempSlider {
  private var tempBinding: Binding<Double> {
    component.current(temps)
  }
  
  private var temp: Double {
    tempBinding.wrappedValue
  }
}
