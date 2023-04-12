import Combine
import SwiftUI

/// A key to access any publishers for key down events
struct KeyDownPublisherKey: EnvironmentKey {
    static var defaultValue: AnyPublisher<NSEvent, Never> = Empty<NSEvent, Never>().eraseToAnyPublisher()
}

extension EnvironmentValues {
    /// The environment variable for the key down publisher
    var keyDownPublisher: AnyPublisher<NSEvent, Never> {
        get { self[KeyDownPublisherKey.self] }
        set { self[KeyDownPublisherKey.self] = newValue }
    }
}
