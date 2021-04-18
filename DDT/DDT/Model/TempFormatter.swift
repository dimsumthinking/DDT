import Foundation

let tempFormatter: NumberFormatter = {
  let f = NumberFormatter()
  f.minimumIntegerDigits = 1
  f.minimumFractionDigits = 1
  f.maximumFractionDigits = 1
  return f
}()

extension Double {
  var tempDisplay: String {
    tempFormatter.string(for: self) ?? "0.0"
  }
}
