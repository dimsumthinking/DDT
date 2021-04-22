import SwiftUI

struct HelpView {
    @Binding var isShowingHelp: Bool
}

extension HelpView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Guide").font(.title).padding()
                Text("""
                Enter the Desired Dough Temperature. \n
                The ideal range is 75 - 78 º F  or
                24 - 25.5 º C. \n
                Enter room temperature as the ambient
                value and also enter your flour temp. \n
                If there's a preferment, toggle the switch
                and enter its temperature. \n
                As you release any slider, the Water
                temperature is updated. \n
                Measure your water at this temperature
                to achieve your desired dough temperature. \n
                This simple change will improve your bread. \n
                Until you have determined the correct
                friction factor, measure the temperature
                of the final dough as it comes off the mixer. \n
                If the actual temperature differs from the
                desired dough temperature, use the settings
                to either directly adjust the friction factor
                or to record the actual temperature and let
                the app calculate the friction factor for you.
                """)
                    .padding()
                Button("Dismiss") {
                    self.isShowingHelp = false
                }
                .padding()
            }
        }
    }
}
