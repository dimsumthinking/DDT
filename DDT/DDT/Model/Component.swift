import SwiftUI

enum Component: String {
  case desired
  case ambient
  case flour
  case preferment
  case friction
  case actual
}

extension Component {
  var name: String {
    rawValue.capitalized
  }
}

extension Component {
  var range: ClosedRange<Double> {
    switch self {
    case .desired: return 70...90
    case .actual: return 60...100
    case .friction: return 0...40
    default: return 30...130
    }
  }
}

extension Component {
  func current(_ temps: Temps) -> Binding<Double> {
    switch self {
    case .desired: return temps.$desired
    case .ambient: return temps.$ambient
    case .flour: return temps.$flour
    case .preferment: return temps.$preferment
    case .friction: return temps.$friction
    default: return temps.$ambient
    }
  }
}
