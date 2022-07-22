import SwiftUI

public struct SaveAndCancel {
  let canNotSave: Bool
  let cancel: () -> Void
  let saveMix: () -> Void
  
  public init(canNotSave: Bool,
              cancel: @escaping () -> Void,
              saveMix: @escaping () -> Void) {
    self.canNotSave = canNotSave
    self.cancel = cancel
    self.saveMix = saveMix
  }
}

extension SaveAndCancel: View {
  public var body: some View {
      HStack {
        Spacer()
        Button("Dismiss", action: cancel)
        Spacer()
        Button("Save", action: saveMix)
          .disabled(canNotSave)
        Spacer()
      }
  }
}


struct SaveAndCancel_Previews: PreviewProvider {
  static var previews: some View {
    SaveAndCancel(canNotSave: false,
                  cancel: {},
                  saveMix: {})
  }
}
