import SwiftUI
import AppInfo

public struct TempView {
  private let name: String
  private let temp: Double
  private let isFriction: Bool
  @EnvironmentObject private var appStatus: AppStatus
  
  public init(name: String,
              temp: Double,
              isFriction: Bool = false) {
    self.name = name
    self.temp = temp
    self.isFriction = isFriction
  }
}

extension TempView: View {
  public var body: some View {
    HStack(spacing: 10) {
      Text(name)
      Spacer()
      Text(isFriction ? temp.affineTemperatureDisplay(appStatus.isCelsius) : temp.temperatureDisplay(appStatus.isCelsius)) 
    }
    .padding(.horizontal)
  }
}

struct TempView_Previews: PreviewProvider {
  static var previews: some View {
    TempView(name: "Water",
             temp: 50)
    .environmentObject(AppStatus())
    
  }
}
