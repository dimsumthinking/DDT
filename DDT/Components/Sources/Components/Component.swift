public enum Component: String {
  case ddt
  case flour
  case ambient
  case preferment
  case friction
  case water
  case final
}

extension Component: CustomStringConvertible {
  public var description: String {
    switch self {
    case .ddt: return rawValue.uppercased()
    case .final: return "Final Dough"
    default: return rawValue.capitalized
    }
  }
}


extension Component {
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

extension Component {
  public var defaultTemp: Double {
    switch self {
    case .friction:
      return 2 // default for hand mixing 24F for machine
    default:
      return 76
    }
  }
}
