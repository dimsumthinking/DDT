import SwiftUI
import MixAddition
import Components

public struct SingleBakeView: View {
  @State private var temperatures = IngredientTemperature()
  
  public init(){}
}

extension SingleBakeView {
  public var body: some View {
    VStack {
      SingleBakeHeaderView()
      ComponentsList(temperatures: temperatures)
    }
    .tabItem {
      Label("Single Bake",
            systemImage: "slider.horizontal.3")
    }
  }
}


struct SingleBakeView_Previews: PreviewProvider {
  static var previews: some View {
    SingleBakeView()
  }
}

