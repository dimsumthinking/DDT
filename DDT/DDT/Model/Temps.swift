import SwiftUI


class Temps: ObservableObject {
  @Published var hasPreferment = false
  @Published var autoFriction = false
  @AppStorage("Desired") var desired = 78.0
  @AppStorage("Flour") var flour = 70.0
  @AppStorage("Preferment") var preferment = 70.0
  @AppStorage("Ambient") var ambient = 70.0
  @AppStorage("Friction") var friction = 20.0
  @Published var updater = false
}



extension Temps {
  var activeTypes: [Component] {
    var componentTypes: [Component] = [.desired, .ambient, .flour]
    if hasPreferment {
      componentTypes.append(.preferment)
    }
    return Array(componentTypes)
  }
}

extension Temps {
  var frictionType: [Component] {
    if autoFriction {
      return [.actual]
    } else {
      return [.friction]
    }
  }
}

extension Temps {
  var water: Double {
    if hasPreferment {
      return desired * 4 - flour - ambient - friction - preferment
    } else {
      return desired * 3 - flour - ambient - friction
    }
  }
}
