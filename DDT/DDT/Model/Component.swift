import SwiftUI

enum Component: String {
  case desired
  case ambient
  case flour
  case preferment
  case friction
  case actual
  case water
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
