import SwiftUI
import Components
import HelperViews
import Persistence
import AppInfo

struct AddCurrentMixView {
  @Binding var isAddingMix: Bool
  @State private var name: String = ""
  @EnvironmentObject private var componentValues: ComponentValues
  @EnvironmentObject private var appStatus: AppStatus
  @FetchRequest(entity: Mix.entity(),
                sortDescriptors: [NSSortDescriptor(key: "name",
                                                   ascending: true)])
  private var mixes: FetchedResults<Mix>
}

extension AddCurrentMixView: View {
  var body: some View {
    List {
      Section {
        Text("Enter unique mix name:")
        NameEntryView(name: $name)
        HStack {
          Spacer()
        Text("This mix name already exists")
          .font(.caption)
          .foregroundColor(nameExists ? .red : .clear)
          Spacer()
        }
      }
      Section {
        TempView(name: ComponentType.ddt.description,
                 temp: componentValues.ddt)
        TempView(name: ComponentType.friction.description,
                 temp: componentValues.friction)
        .padding(.vertical, 6)
        CheckView(name: "Preferment", isChecked:  componentValues.hasPreferment)
      }
      .font(.title2)
      HStack {
        Spacer()
        Button("Dismiss", role: .cancel, action: dismiss)
        Spacer()
        Button("Save", action: save)
          .disabled(name.count < 4 || nameExists)
        Spacer()
      }
    }
  }
}

extension AddCurrentMixView {
  private func dismiss() {
    isAddingMix = false
  }
  private func save() {
    _ = Mix(name: name,
            desiredDoughTemperature: componentValues.ddt,
            frictionCoefficient: componentValues.friction,
            hasPreferment: componentValues.hasPreferment,
            isCelsius: appStatus.isCelsius,
            context: newBackgroundContext()
    )
    dismiss()
  }
  private var nameExists: Bool {
    mixes.map{mix in mix.name.lowercased()}.contains(name.lowercased())
  }
}

//struct AddCurrentMixView_Previews: PreviewProvider {
//  static var previews: some View {
//    AddCurrentMixView(isAddingMix: .constant(true))
//  }
//}
