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
    public init() {
        #if os(Linux)
        srandom(UInt32(time(nil)))
        #endif
    }

    public func generatePlayer(name: String?) -> GameCharacter {
        let player = GameCharacter()
        if (name != nil) {
            player.name = name!
        }
        player.intelligence = self.getRandomNum(20, 80)
        player.charisma = self.getRandomNum(20, 80)
        player.strength = self.getRandomNum(20, 80)
        player.dexterity = self.getRandomNum(20, 80)
        return player
    }

    func getRandomNum(_ min: Int, _ max: Int) -> Int {
        #if os(Linux)
        return Int(random() % max) + min
        #else
        return Int(arc4random_uniform(UInt32(max)) + UInt32(min))
        #endif
    }
}

