import Foundation

public enum ToolbarType: Int, Identifiable {
  case help
  case settings
  case modes
  // swiftlint:disable identifier_name
  public var id: Int {
    rawValue
  }
  // swiftlint:enable identifier_name
}
