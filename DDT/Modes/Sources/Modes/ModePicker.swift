import SwiftUI
import HelperViews

public struct ModePicker {
  private let dismissPicker: () -> Void
  @AppStorage("Mode") private var mode: Mode = .singleBake
  public init(dismissPicker: @escaping () -> Void) {
    self.dismissPicker = dismissPicker
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
                    action: dismissPicker)
    }
  }
}

struct ModePicker_Previews: PreviewProvider {
  static var previews: some View {
    ModePicker(dismissPicker: {})
  }
}
