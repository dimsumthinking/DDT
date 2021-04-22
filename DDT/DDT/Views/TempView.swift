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

fileprivate let tempFormatter: NumberFormatter = {
  let f = NumberFormatter()
  f.minimumIntegerDigits = 1
  f.minimumFractionDigits = 1
  f.maximumFractionDigits = 1
  return f
}()

extension Double {
  fileprivate var tempDisplay: String {
    tempFormatter.string(for: self) ?? "0.0"
  }
}

