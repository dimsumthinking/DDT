import CoreData

extension Mix {
  public convenience init(name: String,
       desiredDoughTemperature: Double,
       frictionCoefficient: Double,
       hasPreferment: Bool,
       context: NSManagedObjectContext) {
    self.init(context: context)
    self.name = name
    self.desiredDoughTemperature = desiredDoughTemperature
    self.frictionCoefficient = frictionCoefficient
    self.hasPreferment = hasPreferment
    self.lastUsed = Date()
    do {try context.save()}
    catch {print("Unable to create \(name)")}
  }
}

extension Mix {
  public func updateDate() {
    self.lastUsed = Date()
    do {try managedObjectContext?.save()}
    catch {print("Unable to update  \(name)")}
  }
  
  public func update(name: String? = nil,
                     desiredDoughTemperature: Double? = nil,
                     frictionCoefficient: Double? = nil,
                     isCelsius: Bool) {
    if let name = name {self.name = name}
    if let desiredDoughTemperature = desiredDoughTemperature {
      self.desiredDoughTemperature = desiredDoughTemperature
    }
    if let frictionCoefficient = frictionCoefficient {
      self.frictionCoefficient = frictionCoefficient
    }
    updateDate()
  }
  
  public func update(frictionCoefficient: Double) {
    self.frictionCoefficient = frictionCoefficient
    updateDate()
  }
}
