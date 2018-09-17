import Foundation
import Kitura
import HeliumLogger

let router = Router()
router.get("/ping") { request, response, next in
    response.send("pong")
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
