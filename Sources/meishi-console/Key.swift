import Foundation

enum Key: String {
    case f13
    case f14
    case f15
    case f16

    init?(key: String) {
        guard let matchedCase = Key(rawValue: key.lowercased()) else {
            return nil
        }

        self = matchedCase
    }

    var command: String {
        switch self {
        case .f13: return "ruby nature_remo/bin/natureremo aircon_change_temperature -1"
        case .f14: return "ruby nature_remo/bin/natureremo aircon_change_temperature 1"
        case .f15: return "hue-lights-controller/hue.sh lightDimmer 1"
        case .f16: return "hue-lights-controller/hue.sh lightBrighter 1"
        }
    }
    
    func trigger() -> String? {
        command.run()
    }
}
