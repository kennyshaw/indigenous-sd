import FluentSQLite
import Vapor

final class SiteStatus: SQLiteUUIDModel {
    var id: UUID?
    var lastUpdated: Date?
    
    
    init(lastUpdated: Date = Date()) {
        self.lastUpdated = lastUpdated
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension SiteStatus: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension SiteStatus: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension SiteStatus: Parameter { }
