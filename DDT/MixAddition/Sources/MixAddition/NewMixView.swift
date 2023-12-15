import SwiftUI
import Persistence
import Components
import SwiftData

public struct NewMixView {
  @State private var ddt: Double = Component.ddt.defaultTemp
  @State private var friction: Double = Component.friction.defaultTemp
  @State private var hasPreferment: Bool = false
  @State private var name: String = ""
  @State private var nameIsInUse = false
  private var isFixed: Bool = false
  @Binding private var isShowingSheet: Bool
  @Query private var mixes: [Mix]
  @Environment(\.modelContext) private var modelContext
}

extension NewMixView {
  
  /// Save current mix initializer
  public init(ddt: Double,
              friction: Double,
              hasPreferment: Bool,
              name: String = "",
              isShowingSheet: Binding<Bool>) {
    _isShowingSheet = isShowingSheet

    self.ddt = ddt
    self.friction = friction
    self.hasPreferment = hasPreferment
    self.name = name
    isFixed = true
  }
  /// Save new mix initializer
  public init(isShowingSheet: Binding<Bool>) {
    _isShowingSheet = isShowingSheet
  }
}

extension NewMixView: View {
  public var body: some View {
    VStack(spacing: 60)  {
      MixNameView(name: $name,
                  nameIsInUse: nameIsInUse)
      .padding()
      if isFixed {
        FixedNewMixComponents(ddt: ddt,
                              friction: friction,
                              hasPreferment: hasPreferment)
      } else {
        AdjustableNewMixComponents(ddt: $ddt,
                                   friction: $friction,
                                   hasPreferment: $hasPreferment)
      }
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
                             desiredDoughTemperature: ddt,
                             frictionCoefficient: friction,
                             hasPreferment: hasPreferment))
    isShowingSheet = false
  }
}


