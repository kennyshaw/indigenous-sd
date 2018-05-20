import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}

final class SiteController {
    /// Returns a list of all `Site`s.
    func index(_ req: Request) throws -> Future<[Site]> {
        return Site.query(on: req).all()
    }
    
    /// Saves a decoded `Site` to the database.
    func create(_ req: Request) throws -> Future<Site> {
        return try req.content.decode(Site.self).flatMap { site in
            return site.save(on: req)
        }
    }
    
    func update(_ req: Request) throws -> Future<Site> {
        return try req.content.decode(Site.self).flatMap { site in
            site.lastUpdated = Date()
            return site.update(on: req)
        }
    }
    
    func populate(_ req: Request) throws -> Future<Site> {
        return try req.content.decode(Site.self).flatMap { site in
            site.lastUpdated = Date()
            return site.save(on: req)
        }
    }
    
    /// Deletes a parameterized `Site`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Site.self).flatMap { site in
            return site.delete(on: req)
            }.transform(to: .ok)
    }
}

final class StatusController {
    func index(_ req: Request) throws -> Future<[SiteStatus]> {
        return SiteStatus.query(on: req).all()
    }
}
