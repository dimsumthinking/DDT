import Foundation

enum ToolbarType: Int, Identifiable {
  case help
  case settings
  var id: Int {
    rawValue
  }
}
