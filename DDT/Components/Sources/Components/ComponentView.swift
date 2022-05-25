import SwiftUI

public struct ComponentView {
  private let type: ComponentType
  @Binding private var temp: Double
  @EnvironmentObject private var componentValues: ComponentValues
  
  public init(for type: ComponentType,
              temp: Binding<Double>) {
    self.type = type
    self._temp = temp
  }
}

extension ComponentView: View {
  public var body: some View {
    VStack {
      TempView(name: type.description,
               temp: temp,
               isFriction: type == .friction)
      .padding(.top)
      Slider(value: $temp,
             in: type.range)
    }
    .onAppear {
      temp = type == .friction ? componentValues.friction : type.defaultTemp
    }
  }
}


struct ComponentView_Previews: PreviewProvider {
  static var previews: some View {
    ComponentView(for: .flour,
                  temp: .constant(70))
      .environmentObject(ComponentValues())
  }
}
