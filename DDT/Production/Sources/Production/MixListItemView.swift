import SwiftUI
import Persistence
import AppInfo

struct MixListItemView {
  @ObservedObject var mix: Mix
  @EnvironmentObject private var appStatus: AppStatus
}

extension MixListItemView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text(mix.name)
        .font(.headline)
      HStack {
        Text("DDT: \(mix.desiredDoughTemperature.tempDisplay(appStatus.isCelsius)) \(appStatus.temperatureScaleIndicator)")
        Spacer()
        Text("Fr: \(mix.frictionCoefficient.affineTempDisplay(appStatus.isCelsius)) \(appStatus.temperatureScaleIndicator)")
        Spacer()
        HStack {
          Text("PF:")
        Image(systemName: mix.hasPreferment ? "checkmark.circle" : "xmark.circle")
        }
      }
      .foregroundColor(.secondary)
    }
    .padding(.vertical)
#if os(iOS)
    .listRowSeparatorTint(.cyan)
    #endif
  }
}

//struct MixListItemView_Previews: PreviewProvider {
//  static var previews: some View {
//    MixListItemView()
//  }
//}