public enum Ingredient: String {
  case ddt
  case flour
  case ambient
  case preferment
  case friction
  case water
  case final
}

extension Ingredient: CustomStringConvertible {
  public var description: String {
    switch self {
    case .ddt: return "Desired Dough Temp"//return rawValue.uppercased()
    case .final: return "Final Dough"
    default: return rawValue.capitalized
    }
  }
}

extension Ingredient {
  public var shortDescription: String {
    switch self {
    case .ddt: return rawValue.uppercased()
    case .final: return "Final"
    case .friction: return "Fr"
    default: return rawValue.capitalized
    }
  }
}


extension Ingredient {
  public var range: ClosedRange<Double> {
    switch self {
    case .ddt:
      return 70 ... 90
    case .friction:
      return 0 ... 40
    default:
      return 40 ... 120
    }
  }
}

extension Ingredient {
  public var defaultTemp: Double {
    switch self {
    case .friction: 2 // default for hand mixing 24F for machine
    default: 76
    }
  }
}


