import SwiftUI
import HelperViews

public struct ComponentView {
  private let type: ComponentType
  @State private var temp: Double
  @EnvironmentObject private var componentValues: ComponentValues
  
  public init(_ type: ComponentType) {
    self.type = type
    self.temp = type.defaultTemp
  }
  
}


extension ComponentView: View {
  public var body: some View {
    VStack {
      TempView(name: type.description,
               temp: temp)
      .padding(.top)
      Slider(value: $temp,
             in: type.range)
    }
    .onChange(of: temp) { newValue in
      type.setValue(temp, in: componentValues)
      print(newValue.description)
    }
  }
}

import AppInfo

struct ComponentView_Previews: PreviewProvider {
  static var previews: some View {
    ComponentView(.flour)
      .environmentObject(AppStatus())
  }
}
