public enum TabType {
  case singleBake
  case production
  case friction
}

extension TabType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .singleBake: return "Single Bake"
    case .production: return "Production"
    case .friction: return "Friction"
    }
  }
}

extension TabType {
  public var systemImageName: String {
    switch self {
    case .singleBake: return "slider.horizontal.3"
    case .production: return "list.bullet.rectangle"
    case .friction: return "arrow.left.arrow.right"
    }
  }
}

import SwiftUI

extension TabType {
  public var label: some View {
    Label(description,
          image: systemImageName)
  }
}
