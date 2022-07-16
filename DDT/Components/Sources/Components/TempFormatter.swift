import Foundation

extension Double {  // public methods for formatting doubles as temps
  public func tempDisplay(_ inCelsius: Bool = false) -> String {
    (inCelsius ? self.toCelsius : self).tempFormatted(inCelsius)
  }
  
  public func affineTempDisplay(_ inCelsius: Bool = false) -> String {
    (inCelsius ? self.affineToCelsius : self).tempFormatted(inCelsius)
  }
}

extension Double { // private method for using formatter and producing String
  private func tempFormatted(_ inCelsius: Bool) -> String {
    (tempFormatter.string(for: self) ?? "0.0") + (inCelsius ? " ºC" : " ºF")
  }
}

private let tempFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.minimumIntegerDigits = 1
  formatter.minimumFractionDigits = 1
  formatter.maximumFractionDigits = 1
  return formatter
}()

extension Double {

  
  private var toCelsius: Double {
    (self - 32) * 5 / 9
  }
  
  private var affineToCelsius: Double {
    self * 5 / 9
  }


}
