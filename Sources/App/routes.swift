import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let siteController = SiteController()
    router.get("sites", use: siteController.index)
    router.post("sites", use: siteController.create)
    router.post("updateSite", use: siteController.update)
    router.post("popluateSites", use: siteController.populate)
    router.delete("sites", Site.parameter, use: siteController.delete)
    
    let statusController = StatusController()
    router.get("lastUpdated", use: statusController.index)
}
