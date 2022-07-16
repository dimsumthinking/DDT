import Foundation
import SwiftUI
import AppInfo


//TODO: Eliminate this class
public class ComponentValues: ObservableObject {
  @Published public var ddt: Double = Component.ddt.defaultTemp
  @Published var flour: Double = Component.flour.defaultTemp
  @Published var preferment: Double = Component.preferment.defaultTemp
  @Published var ambient: Double = Component.ambient.defaultTemp
  @AppStorage("FrictionCoefficient") public var friction: Double = Component.friction.defaultTemp
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
  public var water: Double {
    if hasPreferment {
      return ddt * 4 - flour - ambient - friction - preferment
    } else {
      return ddt * 3 - flour - ambient - friction
    }
  }
}
