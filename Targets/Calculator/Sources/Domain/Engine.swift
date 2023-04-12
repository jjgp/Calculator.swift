import SwiftUI

/// The calculator engine for computing the display and values from the input keys
@MainActor
final class Engine: ObservableObject {
    @Published var display: String = "0"

    func send(_ key: Key) throws {
        // TODO: actual computation. For now just display the key.text
        display = key.text
    }
}
