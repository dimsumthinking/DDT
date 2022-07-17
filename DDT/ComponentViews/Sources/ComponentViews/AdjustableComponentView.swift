import SwiftUI
import Components

public struct AdjustableComponentView {
  let type: Component
  @State private var temp: Double = 0
  //  @EnvironmentObject private var componentValues: ComponentValues
  
  public init(type: Component) {
    self.type = type
  }
}

extension AdjustableComponentView: View {
  public var body: some View {
    Text("Replace me")
  }
}

//extension AdjustableComponentView: View {
//  public var body: some View {
//    ComponentView(for: type,
//                 temp:  $temp)
//    .onChange(of: temp) { newValue in
//      type.setValue(temp, in: componentValues)
//    }
//  }
//}


struct AdjustableComponentView_Previews: PreviewProvider {
  static var previews: some View {
    AdjustableComponentView(type: .flour)
    //      .environmentObject(ComponentValues())
  }
}

