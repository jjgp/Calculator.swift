struct KeyMeta {
    enum Kind {
        ///
        case function

        ///
        case operand

        ///
        case `operator`
    }

    let command: String?
    let kind: Kind
    let text: String

    init(command: String? = nil, kind: Kind, text: String) {
        self.command = command
        self.kind = kind
        self.text = text
    }
}

///  Represents the available keys on the calculator
enum Key: CaseIterable {
    case allClear, clear, decimal, equals, percent, sign
    case add, divide, multiply, subtract
    case zero, one, two, three, four, five, six, seven, eight, nine

    /// Meta information related to the key and its behavior
    var meta: KeyMeta {
        switch self {
        case .allClear: return KeyMeta(command: "c", kind: .function, text: "AC")
        case .clear: return KeyMeta(command: "c", kind: .function, text: "C")
        case .add: return KeyMeta(command: "+", kind: .operator, text: "+")
        case .decimal: return KeyMeta(command: ".", kind: .function, text: ".")
        case .divide: return KeyMeta(command: "/", kind: .operator, text: "/")
        case .eight: return KeyMeta(command: "8", kind: .operand, text: "8")
        case .equals: return KeyMeta(command: "=", kind: .function, text: "=")
        case .five: return KeyMeta(command: "5", kind: .operand, text: "5")
        case .four: return KeyMeta(command: "4", kind: .operand, text: "4")
        case .multiply: return KeyMeta(command: "*", kind: .operator, text: "*")
        case .nine: return KeyMeta(command: "9", kind: .operand, text: "9")
        case .one: return KeyMeta(command: "1", kind: .operand, text: "1")
        case .percent: return KeyMeta(command: "%", kind: .function, text: "%")
        case .seven: return KeyMeta(command: "7", kind: .operand, text: "7")
        case .sign: return KeyMeta(kind: .function, text: "+/-")
        case .six: return KeyMeta(command: "6", kind: .operand, text: "6")
        case .subtract: return KeyMeta(command: "-", kind: .operator, text: "-")
        case .three: return KeyMeta(command: "3", kind: .operand, text: "3")
        case .two: return KeyMeta(command: "2", kind: .operand, text: "2")
        case .zero: return KeyMeta(command: "0", kind: .operand, text: "0")
        }
    }
}
