import Foundation

public typealias Temperature = Double

/// public method for formatting doubles given component
extension Temperature {
  public func displayTemperature(for component: Component) -> (Bool) -> String {
    switch component {
    case .friction:
      return affineTemperatureDisplay
    default:
      return temperatureDisplay
    }
  }
}

///  methods for formatting doubles as temps
extension Temperature {
  /// formats all components except friction which needs a different conversion rule
  private func temperatureDisplay(_ isCelsius: Bool = false) -> String {
    (isCelsius ? self.toCelsius : self)
      .temperatureFormatted(isCelsius)
  }
  /// formats friction which uses a conversion that rescales without recentering
  private func affineTemperatureDisplay(_ isCelsius: Bool = false) -> String {
    (isCelsius ? self.affineToCelsius : self)
      .temperatureFormatted(isCelsius)
  }
}

extension Temperature {
  /// private method for using formatter and producing String  with temperature scale appended
  private func temperatureFormatted(_ isCelsius: Bool) -> String {
    (temperatureFormatter.string(for: self) ?? "0.0")
    + (isCelsius ? " ºC" : " ºF")
  }
}


/// formats doubles with one tenths place digit and one or more integer places
private let temperatureFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.minimumIntegerDigits = 1
  formatter.minimumFractionDigits = 1
  formatter.maximumFractionDigits = 1
  return formatter
}()

extension Temperature {
/// Standard conversion of Fahrenheit to Celsius
  private var toCelsius: Double {
    (self - 32) * 5 / 9
  }
  
  /// Conversion of Fahrenheit to Celsius degrees from 0
  /// i.e. if I'm adding 4 degrees of friction C this should be around 9 F not 9 + 32
  private var affineToCelsius: Double {
    self * 5 / 9
  }
}
