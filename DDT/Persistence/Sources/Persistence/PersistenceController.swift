import CoreData

fileprivate let sharedContainer = PersistenceController().container
public let sharedViewContext = sharedContainer.viewContext
public func newBackgroundContext() -> NSManagedObjectContext {
  sharedContainer.newBackgroundContext()
}

struct PersistenceController {
  static let shared = PersistenceController()
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    guard let container = persistentContainer else {fatalError("Couldn't create Core Data stack")}
    container.viewContext.automaticallyMergesChangesFromParent = true
    self.container = container
  }
}

