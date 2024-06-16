import SwiftUI
import Persistence
import Components
import MixAddition
import SwiftData

struct MixListItemView: View {
  var mix: Mix
  @State private var nameIsInUse = false
  @State private var name: String = ""
  @State private var notEditing = true
  @Query var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext

  init(mix: Mix) {
    self.mix = mix
  }
}

extension MixListItemView {
  var body: some View {
    VStack(alignment: .leading) {
      if notEditing {
        Text(name)
          .padding(.bottom)
          .contentShape(Rectangle())
          .onTapGesture { notEditing = false}
      } else {
        MixNameView(name: $name,
                    nameIsInUse: nameIsInUse)
        .onSubmit {
          if nameIsInUse || name.count < 5 {
            name = mix.name
          } else {
            mix.name = name
            do {
              try modelContext.save()
            } catch {
              print("Could not save new name \(name)")
            }
          }
          notEditing = true
        }
      }
      HStack {
        MiniTemperatureDisplay(mix.desiredDoughTemperature,
                           for: .ddt)
        Spacer()
        MiniTemperatureDisplay(mix.frictionCoefficient,
                           for: .friction)
        Spacer()
        Text("PF")
          .foregroundColor(mix.hasPreferment ? .secondary : .clear)
        Spacer()
      }
      .padding(.horizontal)
      .foregroundColor(.secondary)
    }
    .animation(.default, value: notEditing)
    .onChange(of: name) {oldValue, newValue in
      nameIsInUse = mixes.filter{$0 != mix}.map(\.name).contains(newValue)
    }
    .onDisappear {notEditing = true}
    .onAppear {
      name = mix.name
    }
  }
}


