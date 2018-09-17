import Foundation
import Kitura
import HeliumLogger
import Shared

let router = Router()
router.get("/ping") { request, response, next in
    response.send("pong")
    next()
}

router.get("/player") { request, response, next in
    let game = Game();
    let player = game.generatePlayer(name: request.queryParameters["name"]);
    response.send(json: player)
    next()
}

print("Running: http://localhost:8090/player")

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
