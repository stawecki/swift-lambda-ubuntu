import Foundation
import Kitura
import HeliumLogger
import Shared

let router = Router()
router.get("/ping") { request, response, next in
    response.send("pong")
    next()
}

router.get("/test") { request, response, next in
    let game = Game();
    let gameTest = game.test();
    response.send(gameTest)
    next()
}

print("Running: http://localhost:8090/test")

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
