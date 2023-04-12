import SwiftUI

struct Display: View {
    @EnvironmentObject private var engine: Engine

    var body: some View {
        Text(engine.display)
            .frame(height: Style.Display.height)
            .padding(.trailing, Style.Display.trailingPadding)
    }
}
