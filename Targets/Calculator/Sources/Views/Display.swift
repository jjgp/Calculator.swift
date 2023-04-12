import SwiftUI

struct Display: View {
    @EnvironmentObject private var solver: Solver

    var body: some View {
        Text(solver.display)
            .frame(height: Style.Display.height)
            .padding(.trailing, Style.Display.trailingPadding)
    }
}
