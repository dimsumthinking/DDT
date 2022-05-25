import SwiftUI
import AppInfo

public struct FrictionView {
  @State private var temp: Double = 0
  @AppStorage("FrictionCoefficient") var friction = defaultMixerFrictionTemp
  @EnvironmentObject private var componentValues: ComponentValues
  public init(){}
}

//TODO: Init temp to = friction?

extension FrictionView: View {
  public var body: some View {
    VStack(spacing: 20) {
      
    ComponentView(for: .friction,
                  temp:  $temp)
    .onChange(of: temp) {temp in
      friction = temp
    }
    HStack {
      Spacer()
      Button {
        temp = defaultHandFrictionTemp
      } label: {
        Text("Hand Mix")
      }
      Spacer()
      Button {
        temp = defaultMixerFrictionTemp
      } label: {
        Text("Machine Mix")
      }
      Spacer()
    }
    .padding(.bottom)
    }
  }
}


struct FrictionView_Previews: PreviewProvider {
  static var previews: some View {
    FrictionView()
  }
}

