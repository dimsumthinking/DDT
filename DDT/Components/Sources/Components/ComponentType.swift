import AppInfo
public enum ComponentType: String {
  case ddt = "DDT"
  case flour
  case ambient
  case preferment
  case friction
}

extension ComponentType: CustomStringConvertible {
  public var description: String {
    rawValue.uppercased()
  }
}


extension ComponentType {
  var range: ClosedRange<Double> {
    switch self {
    case .ddt:
      return desiredRange
    case .friction:
      return frictionRange
    default:
      return defaultRange
    }
  }
}

extension ComponentType {
  var defaultTemp: Double {
    switch self {
    case .friction:
      return defaultMixerFrictionTemp
    default:
      return defaultComponentsTemp
    }
  }
}

extension ComponentType {
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
