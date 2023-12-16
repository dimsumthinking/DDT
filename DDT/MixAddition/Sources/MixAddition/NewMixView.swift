import SwiftUI
import Persistence
import Components
import SwiftData

public struct NewMixView {
  @Bindable var temperatures: ComponentTemperatures
  @State private var name: String = ""
  @State private var nameIsInUse = false
  @Binding private var isShowingSheet: Bool
  @Query private var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext
}

extension NewMixView {
  
  /// Save current mix initializer
  public init(temperatures: ComponentTemperatures = ComponentTemperatures(),
              isShowingSheet: Binding<Bool>) {
    self.temperatures = temperatures
    _isShowingSheet = isShowingSheet
  }
}

extension NewMixView: View {
  public var body: some View {
    VStack(spacing: 60)  {
      MixNameView(name: $name,
                  nameIsInUse: nameIsInUse)
      .padding()
      AdjustableNewMixComponents(temperatures: temperatures)
      SaveAndCancel(canNotSave: canNotSave,
                    cancel: dismiss,
                    saveMix: save)
      Spacer()
    }
    .onChange(of: name){ oldValue, newValue in
      nameIsInUse = mixes.map(\.name).contains(newValue)
    }
    .padding()
  }
}


extension NewMixView {
  private var canNotSave: Bool {
    nameIsInUse || name.count < 5
  }
  private func dismiss() {
    isShowingSheet = false
  }
  private func save() {
    modelContext.insert( Mix(name: name,
                             desiredDoughTemperature: temperatures.ddt,
                             frictionCoefficient: temperatures.friction,
                             hasPreferment: temperatures.hasPreferment))
    isShowingSheet = false
  }
}


