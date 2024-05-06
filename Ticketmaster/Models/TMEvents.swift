import Foundation

// MARK: - TMEvents
struct TMEvents: Codable, Hashable {
    let links: TMLinks
    let embedded: TMEmbedded
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMEmbedded
struct TMEmbedded: Codable, Hashable {
    let events: [TMEvent]
}
