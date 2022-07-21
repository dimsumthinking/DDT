import SwiftUI
import MixAddition
import Components

public struct SingleBakeView {
//  @EnvironmentObject private var appStatus: AppStatus
  @State private var isAddingMix: Bool = false
  @State private var isShowingCorF: Bool = false
  @AppStorage("isCelsius") private var isCelsius: Bool = false
  @StateObject private var temperatures = ComponentTemperatures()
  @State private var hasPreferment = false
  public init(){}
}

extension SingleBakeView: View {
  public var body: some View {
    NavigationView {
      ComponentsList(hasPreferment: $hasPreferment,
                     temperatures: temperatures)
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
        .alert("Temperature Scale",
               isPresented: $isShowingCorF) {
          Button("Celsius") {
            isCelsius = true
            isShowingCorF = false
          }
          Button("Fahrenheit") {
            isCelsius = false
            isShowingCorF = false
          }
          Button("Cancel") {
            isShowingCorF = false
          }
        }
               .sheet(isPresented: $isAddingMix) {
                 NewMixView(ddt: temperatures.ddt,
                            friction: temperatures.friction,
                            hasPreferment: hasPreferment, isShowingSheet: $isAddingMix)
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

//import Components

struct SingleBakeView_Previews: PreviewProvider {
  static var previews: some View {
    SingleBakeView()
//      .environmentObject(AppStatus())
    //      .environmentObject(ComponentValues())
  }
}

