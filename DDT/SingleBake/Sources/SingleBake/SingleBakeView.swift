import SwiftUI
import MixAddition
import Components

public struct SingleBakeView {
  @State private var isAddingMix: Bool = false
  @State private var isShowingCorF: Bool = false
  @State private var temperatures = ComponentTemperatures()
  let name: String
  public init(name: String = ""){
    self.name = name
  }
}

extension SingleBakeView: View {
  public var body: some View {
    NavigationView {
      ComponentsList(temperatures: temperatures)
#if os(iOS)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("ºC / ºF") {
              isShowingCorF = true
            }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              isAddingMix = true
            }
          label: {Image(systemName: "plus")}
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("DDT Calculator")
        .modifier(TemperatureScaleAlert(isShowingCorFAlert: $isShowingCorF))
               .sheet(isPresented: $isAddingMix) {
                 NewMixView(temperatures: temperatures,
                            isShowingSheet: $isAddingMix)
               }
#endif
    }
    .navigationViewStyle(.stack)
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

