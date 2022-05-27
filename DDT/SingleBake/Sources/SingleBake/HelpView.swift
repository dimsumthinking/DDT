import SwiftUI
import HelperViews
import AppInfo

struct HelpView {
  @Binding var isShowingSettings: Bool
  @Binding var isShowingHelp: Bool
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
          isShowingHelp = false
          isShowingSettings = true
        }
        .padding()
      
    }
  }
}

