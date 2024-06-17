import SwiftUI
import Persistence
import Components
import SwiftData

public struct NewMixView: View {
  @Bindable var temperatures: IngredientTemperature
  @State private var name: String = ""
  @State private var nameIsInUse = false
  @Binding private var isShowingSheet: Bool
  @Query private var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext
}

// MARK: - init() that preserves default init()
extension NewMixView {
  public init(temperatures: IngredientTemperature = IngredientTemperature(),
              isShowingSheet: Binding<Bool>) {
    self.temperatures = temperatures
    _isShowingSheet = isShowingSheet
  }
}

// MARK: - Appearance
extension NewMixView {
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

// MARK: - Utilities
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


