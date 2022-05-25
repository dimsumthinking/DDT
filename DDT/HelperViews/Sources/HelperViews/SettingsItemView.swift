import SwiftUI

public struct SettingsItemView {
  let heading: String
  let toggleAction: () -> Bool
  let onText: String
  let offText: String
  @Binding var toggleResult: Bool
  
  public init(heading: String,
              toggleAction: @escaping () -> Bool,
              onText: String,
              offText: String,
              toggleResult: Binding<Bool>) {
    self.heading = heading
    self.toggleAction = toggleAction
    self.onText = onText
    self.offText = offText
    self._toggleResult = toggleResult
  }
}

extension SettingsItemView: View {
    public var body: some View {
      VStack(spacing: 20) {
        HStack {
          Text(heading)
          Spacer()
        }
        HStack {
          Spacer()
          Button {
            toggleResult = toggleResult ? toggleResult : toggleAction()
          } label: {
            Text(onText)
              .foregroundColor(toggleResult ? .red : .secondary)
          }
          Spacer()
          Button {
            toggleResult = toggleResult ?  toggleAction() : toggleResult
          } label: {
            Text(offText)
              .foregroundColor(toggleResult ? .secondary : .red)
          }
          Spacer()
        }
      }
      .padding()
      .border(Color.secondary, width: 1)
      .padding()
    }
}

struct SettingsItemView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsItemView(heading: "Heading",
                         toggleAction: { true},
                         onText: "on",
                         offText: "off",
                         toggleResult: .constant(true))
    }
}
