import Foundation

extension String {
    @discardableResult
    func run() -> String? {
        let pipe = Pipe()
        let process = Process()
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", self]
        process.standardOutput = pipe
        process.standardError = pipe

        let fileHandle = pipe.fileHandleForReading
        process.launch()

        return String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)
    }
}
