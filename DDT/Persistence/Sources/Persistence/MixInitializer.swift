import CoreData

extension Mix {
  convenience init(name: String,
       desiredDoughTemperature: Double,
       frictionCoefficient: Double,
       isFahrenheit: Bool,
       hasPreferment: Bool,
       isFrictionUpdatable: Bool,
       context: NSManagedObjectContext = sharedViewContext) {
    self.init(context: context)
    self.desiredDoughTemperature = desiredDoughTemperature
    self.frictionCoefficient = frictionCoefficient
    self.isFahrenheit = isFahrenheit
    self.hasPreferment = hasPreferment
    self.isFrictionUpdatable = isFrictionUpdatable
    try? context.save()
  }
}

