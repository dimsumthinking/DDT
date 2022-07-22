import CoreData

public let namelessMix = Mix()

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
  
  convenience init() { // for comparison for new mixes
    self.init(context: newBackgroundContext())
    self.name = ""
    self.desiredDoughTemperature = 0
    self.frictionCoefficient = 0
    self.hasPreferment = false
    self.lastUsed = Date()
  }
}

extension Mix {
  public func updateDate() {
    self.lastUsed = Date()
    do {try managedObjectContext?.save()}
    catch {print("Unable to update  \(name)")}
  }
  
  public func update(frictionCoefficient: Double) {
    self.frictionCoefficient = frictionCoefficient
    updateDate()
  }
  
  public func update(name: String) {
    self.name = name
    updateDate()
  }
}
