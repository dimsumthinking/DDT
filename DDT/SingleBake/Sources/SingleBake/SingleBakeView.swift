import SwiftUI
import MixAddition
import Components

public struct SingleBakeView: View {
  @State private var temperatures = IngredientTemperature()
  
  public init(){}
}

extension SingleBakeView {
  public var body: some View {
    NavigationStack {
      ComponentsList(temperatures: temperatures)
        .toolbar {
          ToolbarItem (placement: .topBarLeading){
            SelectTemperatureScaleView()
          }
          ToolbarItem (placement: .topBarTrailing){
            AddMixView(temperatures: temperatures)
          }
        }
        .navigationTitle("DDT Calculator")
        .navigationBarTitleDisplayMode(.inline)
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

