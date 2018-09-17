import Foundation
import Shared

//do {
    let data = FileHandle.standardInput.readDataToEndOfFile()

let inputString = String(data: data, encoding: .utf8)

// Make up some data
let name = "Alex";
let age = 30;
let game = Game();
let gameTest = game.test();
let infoDictionary: [String : Any] = ["name":name,"age":age,"gt":gameTest,"input":inputString!];

let jsonInfo = try? JSONSerialization.data(withJSONObject: infoDictionary, options: [])
let jsonInfoString = String(data:jsonInfo!, encoding: .utf8)

// Create response data
let responseDictionary: [String : Any] = ["statusCode":200, "headers":["Content-Type":"application/json"], "body": jsonInfoString!]
let jsonData = try? JSONSerialization.data(withJSONObject: responseDictionary, options: [])

FileHandle.standardOutput.write(jsonData!)

//} catch let error {
//    print("%@", error)
//}
