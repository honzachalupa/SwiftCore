import SwiftUI

public struct SheetCloseButton: View {
    var alignment: Alignment
    var action: () -> Void
    
    public init(
        alignment: Alignment = .trailing,
        action: @escaping () -> Void
    ) {
        self.alignment = alignment
        self.action = action
    }
    
    public var body: some View {
        HStack {
            if (alignment == .trailing) {
                Spacer()
            }
            
            VStack {
                Button(action: action, label: {
                    ZStack {
                        Circle()
                            .fill(.primary.opacity(0.15))
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                    .padding(8)
                    .contentShape(Circle())
                })
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel(Text("Zavřít"))
                
                Spacer()
            }
            .padding(5)
            
            if (alignment == .leading) {
                Spacer()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SheetCloseButton() {}
    SheetCloseButton(alignment: .trailing) {}
    SheetCloseButton(alignment: .leading) {}
}
