import AppInfo

public enum Component: String {
  case ddt
  case flour
  case ambient
  case preferment
  case friction
}

extension Component: CustomStringConvertible {
  public var description: String {
    switch self {
    case .ddt: return rawValue.uppercased()
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
      return 24
    default:
      return 76
    }
  }
}

extension Component {
  public func setValue(_ value: Double, in componentValues: ComponentValues)  {
    switch self {
    case .ddt:
      componentValues.ddt = value
    case .flour:
      componentValues.flour = value
    case .ambient:
      componentValues.ambient = value
    case .preferment:
      componentValues.preferment = value
    case .friction:
      componentValues.friction = value
    }
  }
}
