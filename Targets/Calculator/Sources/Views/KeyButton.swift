import Combine
import SwiftUI

/// A view to represent a clickable interface for a calculator key
struct KeyButton: View {
    private enum Constants {
        static let animationDuration = 0.1
        static let normalOpacity = 1.0
        static let pressedOpacity = 0.5
    }

    private let color: Color
    private let height: CGFloat
    private let key: Key
    @Environment(\.keyDownPublisher) var keyDownMonitor
    @State private var opacity = Constants.normalOpacity
    private let width: CGFloat

    init(_ key: Key,
         color: Color = .gray,
         width: CGFloat = Style.Grid.Key.width,
         height: CGFloat = Style.Grid.Key.height)
    {
        self.color = color
        self.height = height
        self.key = key
        self.width = width
    }

    var body: some View {
        ZStack {
            color.opacity(opacity)

            Text(key.text)
        }
        .frame(width: width, height: height)
        .onReceive(keyDownMonitor.filter { event in
            event.characters == key.command
        }) { _ in
            self.onTapOrKeyDown()
        }
        .contentShape(Rectangle())
        .onLongPressGesture {
            // TODO: action
        } onPressingChanged: { isPressed in
            withAnimation(.linear(duration: Constants.animationDuration)) {
                opacity = isPressed ? Constants.pressedOpacity : Constants.normalOpacity
            }
        }
        .onTapGesture(perform: onTapOrKeyDown)
    }

    private func onTapOrKeyDown() {
        let animationDuration = Constants.animationDuration

        withAnimation(.linear(duration: animationDuration)) {
            opacity = Constants.pressedOpacity
        }

        withAnimation(.linear(duration: animationDuration).delay(animationDuration)) {
            opacity = Constants.normalOpacity
        }

        // TODO: action
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        KeyButton(.ac)
    }
}
