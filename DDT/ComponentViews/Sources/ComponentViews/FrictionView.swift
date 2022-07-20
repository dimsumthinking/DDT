//import SwiftUI
//import AppInfo
//import Components
////TODO: Replace hard coded 24
//public struct FrictionView {
//  @State private var temp: Double = 0
//  @AppStorage("FrictionCoefficient") var friction: Double = 24
////  @EnvironmentObject private var componentValues: ComponentValues
//  @EnvironmentObject private var appStatus: AppStatus
//  public init(){}
//}
//
//extension FrictionView: View {
//  public var body: some View {
//    VStack(spacing: 20) {
//      
////    ComponentView(for: .friction,
////                  temp:  $temp)
////    .onChange(of: temp) {temp in
////      friction = temp
////    }
//      Text("Start with \(2.temperatureDisplay(appStatus.isCelsius)) for hand mixing")
//      Text("and \(24.temperatureDisplay(appStatus.isCelsius)) for machine mixing")
//    .padding(.bottom)
//    }
//  }
//}
//
//
//struct FrictionView_Previews: PreviewProvider {
//  static var previews: some View {
//    FrictionView()
////      .environmentObject(ComponentValues())
//  }
//}
//
