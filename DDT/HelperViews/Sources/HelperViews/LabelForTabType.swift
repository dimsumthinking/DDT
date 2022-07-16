import SwiftUI

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
    TabView {
      Text("Placeholder")
        .tabItem {
          LabelForTabType(.friction)
        }
    }
    
  }
}
