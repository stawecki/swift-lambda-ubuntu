
public struct GameCharacter: Encodable {
    let name: String
}

public class Game {
    public init() {

    }

    public func generatePlayer(name: String?) -> GameCharacter {
        let player = GameCharacter(name: (name != nil ? name! : "Unnamed") )
        return player
    }

    
    public func test() -> String {
      return "test"
    }
}

