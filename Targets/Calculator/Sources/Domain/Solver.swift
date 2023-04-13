import SwiftUI

/// An implementation of a calculator solver for computing the display and values from the input keys
@MainActor
final class Solver: ObservableObject {
    struct State: Equatable {
        var fractional: String?
        var integer: String = "0"
        var key: Key?
        var subtotal = 0.0
    }

    ///
    @Published var display: String = "0"

    var state: State = .init()

    func send(_ key: Key) throws {
        // TODO: if invalid operation like adding another decimal
        let keyMeta = key.meta

        switch keyMeta.kind {
        case .function:
            handleFunction(key: key)
        case .operand:
            handleOperand(keyMeta: keyMeta)
        case .operator:
            try handleOperator(key: key)
        }

        handleDisplay(key: key, keyMeta: keyMeta)

        state.key = key
    }

    private func handleDisplay(key _: Key, keyMeta: KeyMeta) {
        // TODO: more conditional formatting and display of operand or result
        if state.subtotal > 0, keyMeta.kind == .operator {
            display = String(format: "%g", state.subtotal)
        } else {
            display = state.operand
        }
    }

    private func handleFunction(key: Key) {
        switch key {
        case .allClear:
            state = .init()
        case .clear:
            state.clear()
        case .decimal:
            if state.fractional == nil {
                state.fractional = "."
            }
        case .equals:
            break
        case .percent:
            break
        case .sign:
            break
        default:
            fatalError("The Key must have Kind.function and switch must handle the case")
        }
    }

    private func handleOperand(keyMeta: KeyMeta) {
        if state.fractional != nil {
            state.fractional?.append(keyMeta.text)
        } else if state.integer != "0" {
            state.integer.append(keyMeta.text)
        } else if keyMeta.text != "0" {
            state.integer = keyMeta.text
        }
    }

    private func handleOperator(key: Key) throws {
        let operand = Double(state.operand) ?? 0

        switch key {
        case .add:
            state.subtotal += operand
        case .subtract:
            state.subtotal -= operand
        case .multiply:
            // TODO: when no subtotal
            state.subtotal = (state.subtotal.isZero ? 1.0 : state.subtotal) * operand
        case .divide:
            guard !operand.isZero else {
                // TODO: throw error
                return
            }

            state.subtotal /= operand
        default:
            fatalError("The Key must have Kind.operator and switch must handle the case")
        }

        state.clear()
    }
}

extension Solver.State {
    mutating func clear() {
        fractional = nil
        integer = "0"
    }

    var operand: String {
        if let fractional {
            return "\(integer)\(fractional)"
        } else {
            return integer
        }
    }
}
