import Combine
import SwiftUI

@main
struct App: SwiftUI.App {
    private let keyDownMonitor: Any?
    private let keyDownPublisher: AnyPublisher<NSEvent, Never>
    private let solver: Solver

    init() {
        let keyDownSubject = PassthroughSubject<NSEvent, Never>()
        let supportedCommands = Set(Key.allCases.map(\.command))
        keyDownMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            guard supportedCommands.contains(event.characters) else {
                return event
            }

            keyDownSubject.send(event)
            return nil
        }

        keyDownPublisher = keyDownSubject.eraseToAnyPublisher()

        solver = .init()
    }

    var body: some Scene {
        WindowGroup {
            VStack(alignment: .trailing, spacing: Style.Grid.spacing) {
                Display()
                Basic()
            }
            .fixedSize()
            .environment(\.keyDownPublisher, keyDownPublisher)
            .environmentObject(solver)
        }
        .windowResizability(.contentSize)
        .windowToolbarStyle(.unified(showsTitle: false))
    }
}
