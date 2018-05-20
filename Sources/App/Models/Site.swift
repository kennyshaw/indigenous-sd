import FluentSQLite
import Vapor

final class Site: SQLiteUUIDModel {
    var id: UUID?
    var category: String
    var title: String
    var lat: Double
    var lon: Double
    var summary: String
    var filename: String
    var lastUpdated: Date?
    var cost: String?
    var hours: String?
    var website: String?
    
    init(category: String, title: String, lat: Double, lon: Double, summary: String, filename: String, cost: String? = nil, hours: String? = nil, website: String? = nil) {
        self.category = category
        self.title = title
        self.lat = lat
        self.lon = lon
        self.summary = summary
        self.filename = filename
        self.cost = cost
        self.hours = hours
        self.website = website
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Site: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Site: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Site: Parameter { }
