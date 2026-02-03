import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var colorHex: String

    init(title: String, description: String, colorHex: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.colorHex = colorHex
    }
}

    