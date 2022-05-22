import CoreData

open class PersistentContainer: NSPersistentContainer {
}


// var persistentContainer: PersistentContainer? = {
//        guard let modelURL = Bundle.module.url(forResource:"Model", withExtension: "momd") else { return  nil }
//        guard let model = NSManagedObjectModel(contentsOf: modelURL) else { return nil }
//        let container = PersistentContainer(name:"Model",managedObjectModel:model)
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                print("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
