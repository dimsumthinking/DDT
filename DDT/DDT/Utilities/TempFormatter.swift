import Foundation

private let tempFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 1
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 1
    return formatter
}()

extension Double {
    var tempDisplay: String {
        tempFormatter.string(for: self) ?? "0.0"
    }
}
