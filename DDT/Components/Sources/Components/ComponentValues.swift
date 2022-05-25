import Foundation
import SwiftUI
import AppInfo

public class ComponentValues: ObservableObject {
  @Published public var ddt = defaultComponentsTemp
  @Published var flour = defaultComponentsTemp
  @Published var preferment = defaultComponentsTemp
  @Published var ambient = defaultComponentsTemp
  @AppStorage("FrictionCoefficient") public var friction = defaultMixerFrictionTemp
  @AppStorage("HasPreferment") public var hasPreferment = true
  
  public init() {}
}

extension ComponentValues {
  public func setPreferment(_ hasPreferment: Bool) {
    self.hasPreferment = hasPreferment
    preferment += 0.00001 // to force a publish
  }
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
