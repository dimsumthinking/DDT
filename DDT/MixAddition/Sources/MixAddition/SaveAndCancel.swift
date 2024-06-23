import SwiftUI

public struct SaveAndCancel: View {
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

extension SaveAndCancel  {
  public var body: some View {
      HStack {
        Spacer()
        Button("Cancel", action: cancel)
        Spacer()
        Button("Save", action: saveMix)
          .disabled(canNotSave)
        Spacer()
      }
  }
}


#Preview {
  SaveAndCancel(canNotSave: false,
                cancel: {},
                saveMix: {})
}
