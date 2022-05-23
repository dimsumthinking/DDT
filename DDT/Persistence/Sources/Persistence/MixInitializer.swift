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
    self.desiredDoughTemperature = initDDT(temp: desiredDoughTemperature,
                                            isCelsius: isCelsius)
    self.frictionCoefficient = initFriction(temp: frictionCoefficient,
                                        isCelsius: isCelsius)
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
      self.desiredDoughTemperature = initDDT(temp: desiredDoughTemperature, isCelsius: isCelsius)
    }
    if let frictionCoefficient = frictionCoefficient {
      self.frictionCoefficient = initFriction(temp: frictionCoefficient, isCelsius: isCelsius)
    }
    updateDate()
  }
  
  public func update(frictionCoefficient: Double,
                     isCelsius: Bool) {
    self.frictionCoefficient = initFriction(temp: frictionCoefficient, isCelsius: isCelsius)
    updateDate()
  }
}

extension Mix { //Temps are stored in F
  private func initDDT(temp: Double,
                       isCelsius: Bool) -> Double {
    return isCelsius ? temp * 9 / 5 + 32 : temp
  }
  
  private func initFriction(temp: Double,
                            isCelsius: Bool) -> Double {
    return isCelsius ? temp * 9 / 5  : temp
  }
}

