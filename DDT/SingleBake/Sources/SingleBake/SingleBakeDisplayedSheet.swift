import Foundation
import SwiftUI

enum SingleBakeDisplayedSheet: Int {
  case settings
  case addMix
  case help
}

extension SingleBakeDisplayedSheet: Identifiable {
  var id: Int {
    rawValue
  }
}
