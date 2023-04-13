import SwiftUI

struct Display: View {
    @EnvironmentObject private var solver: Solver

    var body: some View {
        Text(solver.display)
            .lineLimit(1)
            .frame(height: Style.Display.height)
            .frame(maxWidth: Style.Display.width, alignment: .trailing)
            .padding([.leading, .trailing], Style.Display.trailingPadding)
    }
}
