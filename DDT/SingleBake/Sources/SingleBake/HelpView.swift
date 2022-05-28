import SwiftUI
import HelperViews
import AppInfo

struct HelpView {
  @Binding var singleBakeDisplayedSheet: SingleBakeDisplayedSheet?
}

extension HelpView: View {
  var body: some View {
      VStack {
        TabView {
          ForEach(helpScreens){screen in
            ScrollView {
              VStack {
            Text(screen.heading)
              .font(.title)
              .padding()
            Text(screen.body)
              .multilineTextAlignment(.leading)
              .padding(.horizontal)
              .padding()
              }
            }
            .tabItem {
              LabelForTabType(screen.type)
            }
          }
        }
       
        
        Button("Dismiss") {
          singleBakeDisplayedSheet = .settings
        }
        .padding()
      
    }
  }
}

