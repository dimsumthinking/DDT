import SwiftUI
import AppInfo
import HelperViews

public struct SingleBakeView {
  @EnvironmentObject private var appStatus: AppStatus
  @State private var isAddingMix: Bool = false
  @State private var isShowingSettings: Bool = false
  @State private var isShowingHelp: Bool = false
  @State private var isShowingCorF: Bool = false
  @AppStorage("isCelsius") private var isCelsius: Bool = false
  public init(){}
}

extension SingleBakeView: View {
  public var body: some View {
    NavigationView {
      ComponentsList()
#if os(iOS)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("ºC / ºF") {
              isShowingCorF = true
            }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
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
#endif
    }
    .navigationViewStyle(.stack)
  }
}

//import Components

struct SingleBakeView_Previews: PreviewProvider {
  static var previews: some View {
    SingleBakeView()
      .environmentObject(AppStatus())
    //      .environmentObject(ComponentValues())
  }
}

