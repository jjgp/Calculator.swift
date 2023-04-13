import SwiftUI

/// An implementation of a calculator solver for computing the display and values from the input keys
@MainActor
final class Solver: ObservableObject {
    struct State: Equatable {
        var fractional: String?
        var integer: String = "0"
        var `operator`: Key = .add
        var subtotal: Double?
    }

    ///
    @Published var display: String = "0"

    private var state: State = .init()

    func send(_ key: Key) throws {
        let meta = key.meta

        switch meta.kind {
        case .function:
            try handleFunction(key: key)
        case .operand:
            handleOperand(meta: meta)
        case .operator:
            try handleOperator(key: state.operator)
            state.operator = key
        }

        handleDisplay(key: key, meta: meta)
    }

    private func handleDisplay(key _: Key, meta: KeyMeta) {
        if meta.kind != .operand, let subtotal = state.subtotal {
            display = String(format: "%g", subtotal)
        } else {
            display = state.operand
        }
    }

    private func handleFunction(key: Key) throws {
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
            try handleOperator(key: state.operator)
            state.clear()
        case .percent:
            break
        case .sign:
            break
        default:
            fatalError("The Key must have Kind.function and switch must handle the case")
        }
    }

    private func handleOperand(meta: KeyMeta) {
        if state.fractional != nil {
            state.fractional?.append(meta.text)
        } else if state.integer != "0" {
            state.integer.append(meta.text)
        } else if meta.text != "0" {
            state.integer = meta.text
        }
    }

    private func handleOperator(key: Key) throws {
        let operand = Double(state.operand) ?? 0
        let subtotal = state.subtotal ?? 0

        switch key {
        case .add:
            state.subtotal = subtotal + operand
        case .subtract:
            state.subtotal = subtotal - operand
        case .multiply:
            state.subtotal = subtotal * operand
        case .divide:
            guard !operand.isZero else {
                // TODO: throw error or other way of updating UI / sounds
                return
            }

            state.subtotal = subtotal / operand
        default:
            fatalError("The Key must have Kind.operator and switch must handle the case")
        }

        state.clear()
    }
}

private extension Solver.State {
    mutating func clear() {
        fractional = nil
        integer = "0"
        self.operator = .add
    }

    var operand: String {
        if let fractional {
            return "\(integer)\(fractional)"
        } else {
            return integer
        }
    }
}
