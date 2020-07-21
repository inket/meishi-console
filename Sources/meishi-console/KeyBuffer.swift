import Foundation

class KeyBuffer {
    typealias KeyPress = (Key, TimeInterval)

    static let shared = KeyBuffer()

    private static let tappingTerm: TimeInterval = 0.2
    private var keyPresses = [KeyPress]()

    private let timer = RepeatingTimer(timeInterval: tappingTerm)

    private init() {
        timer.eventHandler = { [weak self] in self?.processKeyPresses() }
    }

    func register(_ key: Key) {
        keyPresses.append((key, Date.timeIntervalSinceReferenceDate))
        timer.resume()
    }

    private func processKeyPresses() {
        var stop = false
        while !keyPresses.isEmpty, !stop {
            let oldestKeyPress = keyPresses.first!
            let secondOldestKeyPress = keyPresses.count > 1 ? keyPresses[1] : nil

            if let secondOldestKeyPress = secondOldestKeyPress {
                if secondOldestKeyPress.1 - oldestKeyPress.1 <= Self.tappingTerm,
                   let keyCombo = KeyCombo(keys: (oldestKeyPress.0, secondOldestKeyPress.0)) {
                    // Within tapping term and is a valid combo, trigger it then remove both key presses
                    print("Triggered keyCombo: \(keyCombo): \(keyCombo.trigger() ?? "nil")")
                    keyPresses.removeFirst(2)
                } else {
                    // Combo was not within the tapping term or wasn't a valid key combo so trigger the first one
                    // and leave the second key press for the next iteration as it might match another combo
                    let key = oldestKeyPress.0
                    print("Triggered key: \(key): \(key.trigger() ?? "nil")")
                    keyPresses.removeFirst()
                }
            } else {
                // Process key press if after tapping term
                if Date.timeIntervalSinceReferenceDate - oldestKeyPress.1 > Self.tappingTerm {
                    let key = oldestKeyPress.0
                    print("Triggered key: \(key): \(key.trigger() ?? "nil")")

                    keyPresses.removeFirst()
                }

                stop = true
            }
        }

        if keyPresses.isEmpty {
            timer.suspend()
        }
    }
}
