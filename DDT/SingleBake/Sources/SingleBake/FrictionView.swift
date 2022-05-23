import SwiftUI
import Components

struct FrictionView {
  @State private var temp: Double = 0
  @State private var isShowingFrictionHelp = false
  @AppStorage("FrictionCoefficient") var friction = defaultMixerFrictionTemp
  @EnvironmentObject private var componentValues: ComponentValues
}

//TODO: Init temp to = friction?

extension FrictionView: View {
  var body: some View {
    VStack(spacing: 20) {
    HStack {
      Text("Friction Factor:")
      Spacer()
      Button {self.isShowingFrictionHelp.toggle()}
        label: {Image(systemName: "questionmark")}
    }
    ComponentView(for: .friction,
                  temp:  $temp)
    .onChange(of: temp) {temp in
      friction = temp
    }
    if isShowingFrictionHelp {
      Text("""
              To tune the friction factor, measure the actual dough temperature and raise or lower the friction factor by the difference between the actual dough temperature and the desired dough temperature.\n\n
              Use the buttons below to start with 24ºF/13ºC for machine mixing or 2ºF/1ºC for hand mixing.
              """)
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
    }
  }
}


struct FrictionView_Previews: PreviewProvider {
  static var previews: some View {
    FrictionView()
  }
}

