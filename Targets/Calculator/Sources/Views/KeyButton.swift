import Combine
import SwiftUI

/// A view that provides a touchable interface for a calculator key
struct KeyButton: View {
    private enum Constants {
        static let animationDuration = 0.1
        static let normalOpacity = 1.0
        static let pressedOpacity = 0.5
    }

    private let color: Color
    private let height: CGFloat
    private let key: Key
    private let keyMeta: KeyMeta
    @Environment(\.keyDownPublisher) private var keyDownMonitor
    @State private var opacity = Constants.normalOpacity
    @EnvironmentObject private var solver: Solver
    private let width: CGFloat

    init(_ key: Key,
         color: Color = .gray,
         width: CGFloat = Style.Grid.Key.width,
         height: CGFloat = Style.Grid.Key.height)
    {
        self.color = color
        self.height = height
        self.key = key
        keyMeta = key.meta
        self.width = width
    }

    var body: some View {
        ZStack {
            color.opacity(opacity)

            Text(keyMeta.text)
        }
        .frame(width: width, height: height)
        .onReceive(keyDownMonitor.filter { event in
            event.characters == keyMeta.command
        }) { _ in
            self.onTapOrKeyDown()
        }
        .contentShape(Rectangle())
        // Note, the order of gesture modifiers matters. Changing will break the functionality. Should, double check this!
        .onTapGesture(perform: onTapOrKeyDown)
        .onLongPressGesture {
            self.sendKey()
        } onPressingChanged: { isPressed in
            withAnimation(.linear(duration: Constants.animationDuration)) {
                opacity = isPressed ? Constants.pressedOpacity : Constants.normalOpacity
            }
        }
    }

    private func onTapOrKeyDown() {
        let animationDuration = Constants.animationDuration

        withAnimation(.linear(duration: animationDuration)) {
            opacity = Constants.pressedOpacity
        }

        withAnimation(.linear(duration: animationDuration).delay(animationDuration)) {
            opacity = Constants.normalOpacity
        }

        sendKey()
    }

    private func sendKey() {
        do {
            try solver.send(key)
        } catch {
            // TODO: display or sound an error
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        KeyButton(.allClear)
    }
}
