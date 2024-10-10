import SwiftUI

public struct LabeledField<Content: View>: View {
    var label: Text
    var isRequired: Bool
    @ViewBuilder let content: Content
    
    public init(
        _ label: LocalizedStringKey,
        isRequired: Bool = false,
        content: Content
    ) {
        self.label = Text(label)
        self.isRequired = isRequired
        self.content = content
    }
    
    @_disfavoredOverload
    public init<S>(
        _ label: S,
        isRequired: Bool = false,
        content: Content
    ) where S : StringProtocol {
        self.label = Text(label)
        self.isRequired = isRequired
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                label
                    .opacity(0.5)
                    .font(.footnote)
                
                if isRequired {
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundStyle(Color.accentColor)
                }
            }
            
            content
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var value: String = ""
    
    Form {
        Section {
            LabeledField("Name", isRequired: true, content: TextField("", text: $value))
            LabeledField("Note", content: TextField("", text: $value))
        }
    }
}
