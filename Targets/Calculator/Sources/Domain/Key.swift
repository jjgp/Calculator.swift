///  Represents the available keys on the calculator
enum Key: CaseIterable {
    case ac, decimal, equals, percent, sign
    case add, divide, multiply, subtract
    case zero, one, two, three, four, five, six, seven, eight, nine

    /// The key down command that is supported by the respective Key
    var command: String? {
        switch self {
        case .ac: return "c"
        case .add: return "+"
        case .decimal: return "."
        case .divide: return "/"
        case .eight: return "8"
        case .equals: return "="
        case .five: return "5"
        case .four: return "4"
        case .multiply: return "*"
        case .nine: return "9"
        case .one: return "1"
        case .percent: return "%"
        case .seven: return "7"
        case .six: return "6"
        case .subtract: return "-"
        case .three: return "3"
        case .two: return "2"
        case .zero: return "0"
        default: return nil
        }
    }

    /// The text to display for the calculator key
    var text: String {
        switch self {
        case .ac: return "AC"
        case .add: return "+"
        case .decimal: return "."
        case .divide: return "/"
        case .eight: return "8"
        case .equals: return "="
        case .five: return "5"
        case .four: return "4"
        case .multiply: return "*"
        case .nine: return "9"
        case .one: return "1"
        case .percent: return "%"
        case .seven: return "7"
        case .sign: return "+/-"
        case .six: return "6"
        case .subtract: return "-"
        case .three: return "3"
        case .two: return "2"
        case .zero: return "0"
        }
    }
}
