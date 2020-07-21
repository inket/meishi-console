import Foundation

enum KeyCombo {
    case acOff
    case acOn
    case lightsOff
    case lightsOn

    init?(keys: (Key, Key)) {
        switch keys {
        case (.f14, .f13): self = .acOff
        case (.f13, .f14): self = .acOn

        case (.f16, .f15): self = .lightsOff
        case (.f15, .f16): self = .lightsOn

        default: return nil
        }
    }

    var command: String {
        switch self {
        case .acOff: return "ruby nature_remo/bin/natureremo aircon_off"
        case .acOn: return "ruby nature_remo/bin/natureremo aircon_on"

        case .lightsOff: return "hue-lights-controller/hue.sh lightOff 1"
        case .lightsOn: return "hue-lights-controller/hue.sh lightOn 1"
        }
    }

    func trigger() -> String? {
        command.run()
    }
}
