import SwiftUI

struct Display: View {
    var body: some View {
        // TODO: dynamic display of the text
        Text("0")
            .frame(height: Style.Display.height)
            .padding(.trailing, Style.Display.trailingPadding)
    }
}
