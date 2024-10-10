import SwiftUI

public enum PillVariant {
    case green
}

public struct Pill: View {
    var value: String
    var variant: PillVariant?
    var onClick: (() -> Void)?
    
    public init(
        _ value: String,
        variant: PillVariant? = nil,
        onClick: (() -> Void)? = nil
    ) {
        self.value = value
        self.variant = variant
        self.onClick = onClick
    }
    
    private func getForegroundColor() -> Color {
        switch variant {
            case .green:
                return .white
            default:
                return .primary
        }
    }
    
    private func getBackground() -> Color {
        switch variant {
            case .green:
                return .green
            default:
                return Colors.tileBackground
        }
    }
    
    public var body: some View {
        if (!value.isEmpty) {
            Group {
                if let onClick = onClick {
                    Button(value) {
                        onClick()
                    }
                } else {
                    Text(value)
                }
            }
            .font(.callout)
            .foregroundStyle(getForegroundColor())
            .lineLimit(1)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                Capsule()
                    .fill(getBackground())
            }
        }
    }
}

/* #Preview(traits: .sizeThatFitsLayout) {
    PreviewGrid { _, _ in
        Pill("Value", variant: .green)
        Pill("Value")
        Pill("Value")
        Pill("Value", variant: .green)
        Pill("Value")
    }
} */
