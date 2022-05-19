import SwiftUI
import Utilities

public struct TempView {
  private let name: String
  private let temp: Double
  @EnvironmentObject private var appStatus: AppStatus
  
  public init(name: String,
              temp: Double) {
    self.name = name
    self.temp = temp
  }
}

extension TempView: View {
  public var body: some View {
    HStack(spacing: 10) {
      Text(name + " Temp")
      Spacer()
      Text(temp.tempDisplay(appStatus.isCelsius))
    }
    .foregroundColor(.blue)
    .font(.title)
    .padding()
  }
}
