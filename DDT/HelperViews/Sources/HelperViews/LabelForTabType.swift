import SwiftUI
import AppInfo

public struct LabelForTabType {
  private let type: TabType
  public init(_ type: TabType) {
    self.type = type
  }
}

extension LabelForTabType: View {
  public var body: some View {
    Label(type.description,
          systemImage: type.systemImageName)
  }
}

struct LabelForTabType_Previews: PreviewProvider {
  static var previews: some View {
    LabelForTabType(.friction)
  }
}
