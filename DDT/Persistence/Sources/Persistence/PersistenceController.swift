import CoreData

fileprivate let sharedContainer = PersistenceController().container
public let sharedViewContext = sharedContainer.viewContext
func newBackgroundContext() -> NSManagedObjectContext {
  sharedContainer.newBackgroundContext()
}

struct PersistenceController {
  static let shared = PersistenceController()
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    container = PersistentContainer(name:"Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
}

