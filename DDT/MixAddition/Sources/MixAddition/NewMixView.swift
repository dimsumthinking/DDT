import SwiftUI
import Persistence
import Components

public struct NewMixView {
 @State private var ddt: Double
  @State private var friction: Double
  @State private var hasPreferment: Bool
  @State private var name: String
  private let isFixed: Bool
  @Binding private var isShowingSheet: Bool
}

extension NewMixView { //initializers
  /// Save current mix initializer
  public init(ddt: Double,
       friction: Double,
       hasPreferment: Bool,
       isShowingSheet: Binding<Bool>) {
    self.ddt = ddt
    self.friction = friction
    self.hasPreferment = hasPreferment
    name = ""
    isFixed = true
    _isShowingSheet = isShowingSheet
  }
  public init(isShowingSheet: Binding<Bool>) {
    self.ddt = Component.ddt.defaultTemp
    self.friction = Component.friction.defaultTemp
    self.hasPreferment = false
    name = ""
    isFixed = false
    _isShowingSheet = isShowingSheet
  }
}

extension NewMixView: View {
  public var body: some View {
    List {
      MixNameView(name: $name,
                  nameIsNotUnique: nameIsNotUnique)
      if isFixed {
        FixedNewMixComponents(ddt: ddt,
                              friction: friction,
                              hasPreferment: hasPreferment)
      } else {
        AdjustableNewMixComponents(ddt: $ddt,
                                   friction: $friction,
                                   hasPreferment: $hasPreferment)
      }
      SaveAndCancel(nameIsNotUnique: nameIsNotUnique,
                    cancel: dismiss,
                    saveMix: save)
      
    }
  }
}

extension NewMixView {
  private var nameIsNotUnique: Bool {
    Mix.matches(name)
  }
}

extension NewMixView {
  private func dismiss() {
    isShowingSheet = false
  }
  private func save() {
    dismiss()
    _ = Mix(name: name,
            desiredDoughTemperature: ddt,
            frictionCoefficient: friction,
            hasPreferment: hasPreferment,
            context: newBackgroundContext()
    )
  }
}


struct NewMixView_Previews: PreviewProvider {
  static var previews: some View {
    NewMixView(ddt: 76,
               friction: 24,
               hasPreferment: true,
               isShowingSheet: .constant(true))
  }
}
