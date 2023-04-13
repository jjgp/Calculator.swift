import SwiftUI

enum Style {
    /// Styling constants related to the textual display of the calculator
    enum Display {
        static let height: CGFloat = 48
        static let trailingPadding: CGFloat = 2
        static let width: CGFloat = 231 // 4 * Grid.Key.width + 3 * Grid.spacing - 2 * trailingPadding
    }

    /// Styling constants related to the grid layout of the calculator
    enum Grid {
        /// Styling constants related to the calculator keys
        enum Key {
            static let height: CGFloat = 48
            static let width: CGFloat = 58
        }

        static let spacing: CGFloat = 1
    }
}
