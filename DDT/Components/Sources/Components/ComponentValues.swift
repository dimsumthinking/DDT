import Foundation

public var componentValues = ComponentValues()

public class ComponentValues: ObservableObject {
  @Published var ddt = defaultComponentsTemp
  @Published var flour = defaultComponentsTemp
  @Published var preferment = defaultComponentsTemp
  @Published var ambient = defaultComponentsTemp
  @Published var friction = defaultMixerFrictionTemp
  @Published private var hasPreferment = true
  public init() {}
}

extension ComponentValues {
  var water: Double {
    if hasPreferment {
      return ddt * 4 - flour - ambient - friction - preferment
    } else {
      return ddt * 3 - flour - ambient - friction
    }
  }
}
