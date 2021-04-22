import SwiftUI

struct ComponentView {
    let name: String
    @Binding private(set) var temp: Double
    let range: ClosedRange<Double>
}

extension ComponentView: View {
    var body: some View {
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
