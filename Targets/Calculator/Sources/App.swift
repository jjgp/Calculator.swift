import Combine
import SwiftUI

@main
struct App: SwiftUI.App {
    private let environment: Environment

    init() {
        environment = .init()
    }

    var body: some Scene {
        WindowGroup {
            VStack(alignment: .trailing, spacing: Style.Grid.spacing) {
                Display()
                Basic()
            }
            .fixedSize()
            .environment(\.keyDownPublisher, environment.keyDownPublisher)
            .environmentObject(environment.solver)
        }
        .windowResizability(.contentSize)
        .windowToolbarStyle(.unified(showsTitle: false))
    }
}

private extension App {
    @MainActor
    final class Environment {
        private let keyDownMonitor: Any?
        let keyDownPublisher: AnyPublisher<NSEvent, Never>
        let solver: Solver

        init() {
            let keyDownSubject = PassthroughSubject<NSEvent, Never>()
            let supportedCommands = Set(Key.allCases.compactMap(\.meta.command))
            keyDownMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                guard let characters = event.characters, supportedCommands.contains(characters) else {
                    return event
                }

                keyDownSubject.send(event)
                return nil
            }

            keyDownPublisher = keyDownSubject.eraseToAnyPublisher()

            solver = .init()
        }
    }
}
