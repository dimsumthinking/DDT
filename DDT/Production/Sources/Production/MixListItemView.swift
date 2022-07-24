import SwiftUI
import Persistence
import Components
import MixAddition

struct MixListItemView {
  @ObservedObject var mix: Mix
  //  @State private var canEdit = false
  @State private var nameIsInUse = false
  @State private var name: String
  private var existingNames: [String]
  
  init(mix: Mix) {
    self.mix = mix
    self.name = mix.name
    existingNames = Mix.existingNames(otherThanIn: mix)
  }
}

extension MixListItemView: View {
  var body: some View {
    VStack(alignment: .leading) {
      MixNameView(name: $name,
                  nameIsInUse: nameIsInUse)
      .onSubmit {
        if nameIsInUse || name.count < 5 {
          name = mix.name
        } else {
          mix.update(name: name)
        }
      }
      HStack {
        TemperatureDisplay(mix.desiredDoughTemperature,
                           for: .ddt,
                           spaced: false)
        Spacer()
        TemperatureDisplay(mix.frictionCoefficient,
                           for: .friction,
                           spaced: false)
        Spacer()
        Text("PF")
          .foregroundColor(mix.hasPreferment ? .secondary : .clear)
        Spacer()
      }
      .padding(.horizontal)
      .foregroundColor(.secondary)
    }
    .onChange(of: name) {value in
      nameIsInUse =  Mix.alreadyUsing(name: name,
                                      in: existingNames)
    }
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
