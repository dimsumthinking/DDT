public enum Mode: Int, CaseIterable, Hashable, Equatable {
  case singleBake
  case production
  case mixManager
}

extension Mode {
  static var allScreens: [Mode] {
    Mode.allCases
  }
}

extension Mode {
  static func screen(_ index: Int) -> Mode {
    Mode(rawValue: index) ?? .singleBake
  }
}

extension Mode: Identifiable {
  public var id: Int {
    self.hashValue
  }
}

extension Mode: CustomStringConvertible {
  public var description: String {
    switch self {
    case .singleBake: return "Single Bake"
    case .production: return "Production"
    case .mixManager: return "Mix Manager"
    }
  }
}

extension Mode {
  var explanation: String {
    switch self {
    case .singleBake:
      return "The classic view where you set the Desired Dough Temperature and then record the measurements for your current bake."
    case .production:
      return "Record the measurements for favorite or scheduled mix settings that you've saved with fixed Desired Dough Temperature and Friction Factor."
    case .mixManager:
      return "Add and edit your list of saved mixes and their Desired Dough Temperaturs and Friction Factors."
    }
  }
}
