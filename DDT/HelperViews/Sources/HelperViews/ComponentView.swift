import SwiftUI

public struct ComponentView {
  let name: String
  let range: ClosedRange<Double>
  @Binding private(set) var temp: Double
  
  public init(name: String,
              range: ClosedRange<Double>,
              temp: Binding<Double>) {
    self.name = name
    self.range = range
    self._temp = temp
  }
  
}

extension ComponentView: View {
  public var body: some View {
    VStack {
      TempView(name: name,
               temp: temp)
      .padding(.top)
      Slider(value: $temp,
             in: range)
    }
    .padding(.bottom)
    .padding(.horizontal)
  }
}
