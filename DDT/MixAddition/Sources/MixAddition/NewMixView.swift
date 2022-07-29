import SwiftUI
import Persistence
import Components

public struct NewMixView {
 @State private var ddt: Double
  @State private var friction: Double
  @State private var hasPreferment: Bool
  @State private var name: String
  @State private var nameIsInUse = false
  private let isFixed: Bool
  @Binding private var isShowingSheet: Bool
  private var existingNames: [String] = Mix.existingNames()
}

extension NewMixView { //initializers
  /// Save current mix initializer
  public init(ddt: Double,
       friction: Double,
       hasPreferment: Bool,
              name: String = "",
       isShowingSheet: Binding<Bool>) {
    self.ddt = ddt
    self.friction = friction
    self.hasPreferment = hasPreferment
    self.name = name
    isFixed = true
    _isShowingSheet = isShowingSheet
  }
  /// Save new mix initializer
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
   .onChange(of: name){value in
     nameIsInUse =  Mix.alreadyUsing(name: name,
                                     in: existingNames)
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
    _ = Mix(name: name,
            desiredDoughTemperature: ddt,
            frictionCoefficient: friction,
            hasPreferment: hasPreferment,
            context: newBackgroundContext()
    )
    isShowingSheet = false
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
