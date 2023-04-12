import SwiftUI

/// A view that lays out the basic keys of the calculator
struct Basic: View {
    var body: some View {
        Grid(horizontalSpacing: Style.Grid.spacing, verticalSpacing: Style.Grid.spacing) {
            GridRow {
                KeyButton(.ac)
                KeyButton(.sign)
                KeyButton(.percent)
                KeyButton(.divide)
            }

            GridRow {
                KeyButton(.seven)
                KeyButton(.eight)
                KeyButton(.nine)
                KeyButton(.multiply)
            }

            GridRow {
                KeyButton(.four)
                KeyButton(.five)
                KeyButton(.six)
                KeyButton(.subtract)
            }

            GridRow {
                KeyButton(.one)
                KeyButton(.two)
                KeyButton(.three)
                KeyButton(.add)
            }

            GridRow {
                KeyButton(.zero, width: 2 * Style.Grid.Key.width + Style.Grid.spacing)
                    .gridCellColumns(2)
                KeyButton(.decimal)
                KeyButton(.equals)
            }
        }
    }
}

struct BasicCalculator_Previews: PreviewProvider {
    static var previews: some View {
        Basic()
    }
}
