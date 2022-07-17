import SwiftUI
import Components
import HelperViews
import Persistence
import AppInfo
import ComponentViews

struct AddCurrentMixView {
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
        NameEntryView(name: $name)
        if nameExists {
          HStack {
            Spacer()
            Text("This mix name already exists")
              .font(.caption)
              .foregroundColor(.red)
            Spacer()
          }
        }
      }
      Section {
        TempView(name: Component.ddt.description,
                 temp: componentValues.ddt)
        TempView(name: Component.friction.description,
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
  
  }
  private func save() {
    dismiss()
    _ = Mix(name: name,
            desiredDoughTemperature: componentValues.ddt,
            frictionCoefficient: componentValues.friction,
            hasPreferment: componentValues.hasPreferment,
            context: newBackgroundContext()
    )
  }
  private var nameExists: Bool {
    mixes.map{mix in mix.name.lowercased()}.contains(name.lowercased())
  }
}

struct AddCurrentMixView_Previews: PreviewProvider {
  static var previews: some View {
    AddCurrentMixView()
      .environmentObject(AppStatus(isCelsius: true))
      .environmentObject(ComponentValues())
  }
}
