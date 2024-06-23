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
    case .ddt:  "Desired Dough Temp"//return rawValue.uppercased()
    case .final:  "Final Dough"
    default:  rawValue.capitalized
    }
  }
}

extension Ingredient {
  public var shortDescription: String {
    switch self {
    case .ddt:  rawValue.uppercased()
    case .final:  "Final"
    case .friction:  "Fr"
    default:  rawValue.capitalized
    }
  }
}


extension Ingredient {
  public var range: ClosedRange<Double> {
    switch self {
    case .ddt: 70 ... 90
    case .friction: 0 ... 40
    default: 40 ... 120
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


