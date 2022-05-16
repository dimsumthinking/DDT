import SwiftUI

public struct TappableBorderedTextWithHeader {
  private let headerText: String?
  private let bodyText: String
  private let action: () -> Void
  private let isCurrentlySelected: Bool
  
  public init(headerText: String?,
              bodyText: String,
              action: @escaping () -> Void,
              isCurrentlySelected: Bool) {
    self.headerText = headerText
    self.bodyText = bodyText
    self.action = action
    self.isCurrentlySelected = isCurrentlySelected
  }
 }

extension TappableBorderedTextWithHeader: View {
  public var body: some View {
      VStack(alignment: .leading, spacing: 10) {
        if let headerText = headerText {
        Text(headerText)
          .font(.headline)
        }
        HStack {
          Text(bodyText)
            .multilineTextAlignment(.leading)
            .font(.caption)
          Spacer()
        }
      }
      .padding()
      .border(isCurrentlySelected ? Color.cyan : Color.secondary,
              width: isCurrentlySelected ? 3 : 1)
      .contentShape(Rectangle())
      .onTapGesture(perform: action)
    }
}

struct BorderedTextWithHeader_Previews: PreviewProvider {
    static var previews: some View {
        TappableBorderedTextWithHeader(headerText: "Header",
                                       bodyText: "Some body text",
                                       action: {},
                                       isCurrentlySelected: true)
    }
}
