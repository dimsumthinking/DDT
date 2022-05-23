import Foundation

private let tempFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.minimumIntegerDigits = 1
  formatter.minimumFractionDigits = 1
  formatter.maximumFractionDigits = 1
  return formatter
}()

extension Double {
  private var tempFormatted: String {
    tempFormatter.string(for: self) ?? "0.0"
  }
  
  private var toCelsius: Double {
    (self - 32) * 5 / 9
  }
  
  private var affineToCelsius: Double {
    self * 5 / 9
  }

  public func tempDisplay(_ inCelsius: Bool = false) -> String {
    (inCelsius ? self.toCelsius : self).tempFormatted
  }
  
  public func affineTempDisplay(_ inCelsius: Bool = false) -> String {
    (inCelsius ? self.affineToCelsius : self).tempFormatted
  }
}
