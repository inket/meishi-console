import Foundation
import HttpSwift

let server = Server()

server.get("/command/{key}") { request in
    guard
        let keyString = request.routeParams["key"],
        let key = Key(key: keyString)
    else {
        return .init(.notFound, body: "Not found")
    }
    
    let output = key.trigger() ?? "No output"

    return .ok(output)
}

let address = "ipconfig getifaddr en0".run()!.trimmingCharacters(in: .whitespacesAndNewlines)
let port: UInt16 = 9321

try server.run(port: port, address: address)

print("Server started at \(address):\(port)")

RunLoop.current.run()
