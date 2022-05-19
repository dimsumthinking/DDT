import SwiftUI
import HelperViews

public struct ModePicker {
  private let dismiss: () -> Void
  @AppStorage("Mode") private var mode: Mode = .singleBake
  public init(dismiss: @escaping () -> Void) {
    self.dismiss = dismiss
  }
}

extension ModePicker: View {
  public var body: some View {
    List {
      SheetHeader(text: "Modes")
      .padding(.vertical)
      ForEach(Mode.allScreens){mode in
        TappableBorderedTextWithHeader(headerText: mode.description,
                                       bodyText: mode.explanation,
                                       action: {self.mode = mode},
                                       isCurrentlySelected: mode == self.mode)
      }
      .padding()
      ButtonInAList(text: "Dismiss",
                    action: dismiss)
    }
  }
}

struct ModePicker_Previews: PreviewProvider {
  static var previews: some View {
    ModePicker(dismiss: {})
  }
}
