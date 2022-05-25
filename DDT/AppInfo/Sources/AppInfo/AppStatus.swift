import Foundation

public class AppStatus: ObservableObject {
  @Published  public private(set) var isCelsius: Bool = false
  @Published  public private(set) var showFrictionSingleBake: Bool = false
  @Published  public private(set) var showFrictionTuning: Bool = false

  public init(isCelsius: Bool = false,
              showFrictionSingleBake: Bool = false,
              showFrictionTuning: Bool = true) {
    self.isCelsius = isCelsius
    self.showFrictionSingleBake = showFrictionSingleBake
    self.showFrictionTuning = showFrictionTuning
  }
}

extension AppStatus {
  public func toggleTemperatureScale() -> Bool {
    isCelsius.toggle()
    return isCelsius
  }
  
  public func toggleShowFrictionSingleBake() -> Bool {
    showFrictionSingleBake.toggle()
    return showFrictionSingleBake
  }
  
  public func toggleShowFrictionTuning() -> Bool {
    showFrictionTuning.toggle()
    return showFrictionTuning
  }
  
  public var temperatureScaleIndicator: String {
    isCelsius ? "ºC" : "ºF"
  }
}
