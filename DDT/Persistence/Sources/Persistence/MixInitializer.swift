import CoreData

extension Mix {
  public convenience init(name: String,
       desiredDoughTemperature: Double,
       frictionCoefficient: Double,
       hasPreferment: Bool,
       isCelsius: Bool,
       context: NSManagedObjectContext) {
    self.init(context: context)
    self.name = name
    self.desiredDoughTemperature = initTemp(temp: desiredDoughTemperature,
                                            isCelsius: isCelsius)
    self.frictionCoefficient = initTemp(temp: frictionCoefficient,
                                        isCelsius: isCelsius)
    self.hasPreferment = hasPreferment
    self.lastUsed = Date()
    print("Created \(name)")
    try? context.save()
  }
}

extension Mix {
  private func initTemp(temp: Double,
                        isCelsius: Bool) -> Double {
    return isCelsius ? temp * 9 / 5 + 32 : temp
  }
}

