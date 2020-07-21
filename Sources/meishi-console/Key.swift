import Foundation

enum Key: String {
    case f12
    case f13
    case f14
    case f15
    
    case f16
    case f17
    case f18
    case f19
    
    init?(key: String) {
        guard let matchedCase = Key(rawValue: key.lowercased()) else {
            return nil
        }

        self = matchedCase
    }
    
    var command: String {
        switch self {
        case .f12: return "ruby nature_remo/bin/natureremo aircon_off"
        case .f13: return "ruby nature_remo/bin/natureremo aircon_change_temperature -1"
        case .f14: return "ruby nature_remo/bin/natureremo aircon_change_temperature 1"
        case .f15: return "ruby nature_remo/bin/natureremo aircon_on"

        case .f16: return "hue-lights-controller/hue.sh lightOff 1"
        case .f17: return "hue-lights-controller/hue.sh lightDimmer 1"
        case .f18: return "hue-lights-controller/hue.sh lightBrighter 1"
        case .f19: return "hue-lights-controller/hue.sh lightOn 1"
        }
    }
    
    func trigger() -> String? {
        command.run()
    }
}
