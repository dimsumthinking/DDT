import SwiftUI
import Persistence
import Components
import MixAddition

struct MixListItemView {
  @ObservedObject var mix: Mix
  @State var canEdit = false
  @State var nameIsInUse = false
}

extension MixListItemView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      if canEdit {
        VStack {
          MixNameView(name: $mix.name,
                      nameIsInUse: nameIsInUse)
          SaveAndCancel(canNotSave: nameIsInUse,
                        cancel: {canEdit = false},
                        saveMix: {
            mix.update(name: mix.name)
            canEdit = false
          })
          .buttonStyle(.borderless)
        }
      } else {
        Text(mix.name)
          .font(.headline)
          .onTapGesture {
            canEdit = true
          }
      }
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
