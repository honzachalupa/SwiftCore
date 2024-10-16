import SwiftUI

public extension Text {
    func adaptedTextColor(background containerBackgroundColor: Color) -> some View {
        self
            .foregroundStyle(
                containerBackgroundColor.adaptedTextColor()
            )
    }
}
