import SwiftUI

struct SaveAndCancel {
  let nameIsNotUnique: Bool
  let cancel: () -> Void
  let saveMix: () -> Void
}

extension SaveAndCancel: View {
  var body: some View {
    Section {
      HStack {
        Spacer()
        Button("Dismiss", role: .cancel, action: cancel)
        Spacer()
        Button("Save", action: saveMix)
          .disabled(nameIsNotUnique)
        Spacer()
      }
    }
  }
}


struct SaveAndCancel_Previews: PreviewProvider {
  static var previews: some View {
    SaveAndCancel(nameIsNotUnique: false,
                  cancel: {},
                  saveMix: {})
  }
}
