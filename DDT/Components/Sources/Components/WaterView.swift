import SwiftUI

//public struct WaterView {
//  let waterTemp: Double
//
//  public init(ddt: Double,
//       flourTemp: Double,
//       ambientTemp: Double,
//       prefermentTemp: Double?,
//       frictionTemp: Double) {
//    if let prefermentTemp =  prefermentTemp {
//      waterTemp = ddt * 4 - flourTemp - ambientTemp - frictionTemp - prefermentTemp
//    } else {
//      waterTemp = ddt * 3 - flourTemp - ambientTemp - frictionTemp
//    }
//  }
//}

public struct WaterView {
  @EnvironmentObject private var componentValues: ComponentValues
  public init() {}
  
//  public init(ddt: Double,
//       flourTemp: Double,
//       ambientTemp: Double,
//       prefermentTemp: Double?,
//       frictionTemp: Double) {
//    if let prefermentTemp =  prefermentTemp {
//      waterTemp = ddt * 4 - flourTemp - ambientTemp - frictionTemp - prefermentTemp
//    } else {
//      waterTemp = ddt * 3 - flourTemp - ambientTemp - frictionTemp
//    }
//  }
}

extension WaterView: View {
  public var body: some View {
    TempView(name: "Water",
             temp: componentValues.water)
//    .padding()
  }
}

//import Utilities

//struct WaterView_Previews: PreviewProvider {
//  static var previews: some View {
//    WaterView(ddt: 80,
//              flourTemp: 70,
//              ambientTemp: 70,
//              prefermentTemp: nil,
//              frictionTemp: 20)
//    .environmentObject(AppStatus())
//  }
//}
//
//
