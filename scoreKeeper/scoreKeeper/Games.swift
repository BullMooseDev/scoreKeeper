import Foundation

struct Games {
    var gameTitle: String
    var sortedBy: Bool
    var winCondition: Bool
    var players: Set<Player> = []
}
