import Foundation

public class AppStatus: ObservableObject {
  @Published  public private(set) var isCelsius: Bool = false
  
  public init(isCelsius: Bool = false) {
    self.isCelsius = isCelsius
  }
}

extension AppStatus {
  public func toggleTemperatureScale() -> Bool {
    isCelsius.toggle()
    return isCelsius
  }
  
  public var temperatureScaleIndicator: String {
    isCelsius ? "ºC" : "ºF"
  }
}
