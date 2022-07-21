import SwiftUI
import Persistence
import Components

struct MixListItemView {
  @ObservedObject var mix: Mix
}

extension MixListItemView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text(mix.name)
        .font(.headline)
      VStack {
        TemperatureDisplay(mix.desiredDoughTemperature,
                           for: .ddt)
        TemperatureDisplay(mix.frictionCoefficient,
                           for: .friction)
        HStack {
          Text("Preferment")
          Spacer()
          Image(systemName: mix.hasPreferment ? "checkmark.circle" : "xmark.circle")
        }
      }
      .padding(.horizontal)
      .foregroundColor(.secondary)
    }
    .padding(.vertical)
#if os(iOS)
    .listRowSeparatorTint(.cyan)
    #endif
  }
}

struct MixListItemView_Previews: PreviewProvider {
  static var previews: some View {
    MixListItemView(mix: Mix(name: "Sample",
                             desiredDoughTemperature: 74,
                             frictionCoefficient: 12,
                             hasPreferment: false, context: newBackgroundContext()))
  }
}
