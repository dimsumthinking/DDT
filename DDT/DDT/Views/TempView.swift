import SwiftUI

struct TempView {
    let name: String
    let temp: Double
}

extension TempView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text(name + " Temp")
            Spacer()
            Text(temp.tempDisplay)
        }
    }
}

import Foundation

private let tempFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 1
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 1
    return formatter
}()

private extension Double {
    var tempDisplay: String {
        tempFormatter.string(for: self) ?? "0.0"
    }
}
