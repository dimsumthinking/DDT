import CoreData

fileprivate let sharedContainer = PersistenceController().container
public let sharedViewContext = sharedContainer.viewContext
func newBackgroundContext() -> NSManagedObjectContext {
  sharedContainer.newBackgroundContext()
}


struct PersistenceController {
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    return result
  }()
  
  let container: NSPersistentCloudKitContainer
  
  
  init(inMemory: Bool = false) {
    container = NSPersistentCloudKitContainer(name: "Model")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        print("================> error loading store")
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
}

