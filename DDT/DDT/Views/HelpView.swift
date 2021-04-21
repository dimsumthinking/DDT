import SwiftUI

struct HelpView {
  @Binding var isShowingHelp: Bool
}
extension HelpView: View {
    var body: some View {
      VStack {
        Spacer()
        Text("Guide").font(.title)
        Spacer()
        VStack(alignment: .leading, spacing: 20) {
        Text("Enter the Desired Dough Temperature (75 - 78 º F / 24 - 25.5 º C)")
        Text("Enter the room (ambient) and flour temperatures.")
        Text("If there's a preferment, toggle the switch and enter the temperature.")
        Text("As you release the slider the Water temperature is updated. Use this to achieve your desired dough temperature.")
        Text("Until you have determined the correct friction factor, measure the temperature of the final dough as it comes off the mixer. If the actual temperature differs from the desired dough temperature, use the settings to either directly adjust the friction factor or to record the actual temperature and let the app calculate the friction factor for you.")
        }.padding(.horizontal)
        Spacer()
        Button("Dismiss"){self.isShowingHelp = false}
        Spacer()
      }
    }
}

