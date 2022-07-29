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
  
  public convenience init(url: URL) { // for imported mixers
    let components = URLComponents(url: url,
                                   resolvingAgainstBaseURL: true)
    guard let queryItems = components?.queryItems,
          var name = components?.host,
          let desiredDoughTemperature = queryValue(named: "d",
                                                   in: queryItems).flatMap(Double.init),
          let frictionCoefficient = queryValue(named: "f",
                                              in: queryItems).flatMap(Double.init),
            let hasPreferment = queryValue(named: "pf",
                                          in: queryItems).flatMap(Bool.init) else {
      self.init()
      return
    }
    if Self.alreadyUsing(name: name, in: Self.existingNames()) {
      name = name + "+"
    }
    self.init(name: name,
              desiredDoughTemperature: desiredDoughTemperature,
              frictionCoefficient: frictionCoefficient,
              hasPreferment: hasPreferment,
              context: newBackgroundContext())
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

fileprivate func queryValue(named name: String,
                        in items: [URLQueryItem]) -> String? {
  items.filter { item in
    item.name == name
  }
  .first?.value
}
