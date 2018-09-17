import Foundation
import Shared

struct APIGatewayEvent: Codable {
    let resource: String?
    let path: String?
    let httpMethod: String?
    let queryStringParameters: [String:String]?
}

// Read Event data passed from the Shim (standard input)
// When testing in the console, paste JSON data and press CTRL+D
let eventData = FileHandle.standardInput.readDataToEndOfFile()
let event = try? JSONDecoder().decode(APIGatewayEvent.self, from: eventData);

// Read "queryStringParameters" from the event object and find "name".
var name = "Unnamed";
if (event != nil && event!.queryStringParameters != nil && event!.queryStringParameters!["name"] != nil) {
    name = event!.queryStringParameters!["name"]!;
}

// Invoke shared code:
let game = Game();
let player = game.generatePlayer(name: name);

// Encode result:
let jsonInfo = try? JSONEncoder().encode(player);
let jsonInfoString = String(data:jsonInfo!, encoding: .utf8)

// Create response data
let responseDictionary: [String : Any] = ["statusCode":200, "headers":["Content-Type":"application/json"], "body": jsonInfoString!]
let jsonData = try? JSONSerialization.data(withJSONObject: responseDictionary, options: [])

// Write response to standard output. It will be read by the Shim.
FileHandle.standardOutput.write(jsonData!)

