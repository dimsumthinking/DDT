import SwiftUI
import Persistence
import Components
import MixAddition

struct MixListItemView: View {
  var mix: Mix
}

extension MixListItemView {
  var body: some View {
    VStack(alignment: .leading) {
      NameView(mix: mix)
      MixSummaryView(ddt: mix.desiredDoughTemperature,
                     frictionCoefficient: mix.frictionCoefficient,
                     hasPreferment: mix.hasPreferment)
      .padding(.horizontal)
      .foregroundColor(.secondary)
    }
  }
}

#Preview(traits: .mixPreviewData) {
  MixListItemView(mix: Mix.sampleMix)
}

