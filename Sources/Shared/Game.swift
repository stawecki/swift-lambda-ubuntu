import Foundation

public class GameCharacter: Encodable {
    public init() {
        name = "Unnamed"
    }
    var name: String
    var intelligence: Int = 0
    var charisma: Int = 0
    var strength: Int = 0
    var dexterity: Int = 0
}

public class Game {
    public init() {}

    public func generatePlayer(name: String?) -> GameCharacter {
        let player = GameCharacter()
        if (name != nil) {
            player.name = name!
        }
        player.intelligence = Int( arc4random_uniform(100) )
        player.charisma = Int( arc4random_uniform(100) )
        player.strength = Int( arc4random_uniform(100) )
        player.dexterity = Int( arc4random_uniform(100) )
        return player
    }
}

