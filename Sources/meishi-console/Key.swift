import Foundation

enum Key: String {
    case f13
    case sf13
    
    case f14
    case sf14
    
    case f15
    case sf15
    
    case f16
    case sf16
    
    init?(key: String) {
        guard let matchedCase = Key(rawValue: key.lowercased()) else {
            return nil
        }

        self = matchedCase
    }
    
    var command: String {
        switch self {
        case .f13: return "ruby nature_remo/bin/natureremo aircon_change_temperature -1"
        case .sf13: return "ruby nature_remo/bin/natureremo aircon_off"

        case .f14: return "ruby nature_remo/bin/natureremo aircon_change_temperature 1"
        case .sf14: return "ruby nature_remo/bin/natureremo aircon_on"
            
        case .f15: return "hue-lights-controller/hue.sh lightDimmer 1"
        case .sf15: return "hue-lights-controller/hue.sh lightOff 1"

        case .f16: return "hue-lights-controller/hue.sh lightBrighter 1"
        case .sf16: return "hue-lights-controller/hue.sh lightOn 1"
        }
    }
    
    func trigger() -> String? {
        command.run()
    }
}
