import SwiftUI

public struct IdentifiableString: Identifiable, Hashable {
    let string: String
    public var id: String { string }
}

public struct MultiPicker<LabelView: View, T: Identifiable & Hashable>: View {
    let label: LabelView
    let options: [T]
    let valueFormatter: (T) -> String
    var selection: Binding<[T]>
    
    @State
    private var isOptionsPresented: Bool = false

    private var formattedSelectedListString: String {
        selection.wrappedValue.count > 0 ?
        ListFormatter.localizedString(byJoining: selection.wrappedValue.map { valueFormatter($0) }) :
        "None"
    }

    public var body: some View {
        Button {
            isOptionsPresented.toggle()
        } label: {
            HStack {
                label
                    .foregroundStyle(.foreground)
                
                Spacer()
                
                Text(formattedSelectedListString)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
            }
        }
        .popover(isPresented: $isOptionsPresented) {
            MultiPickerChildView(
                options: options,
                valueFormatter: valueFormatter,
                selection: selection
            )
            .frame(width: 400, height: 400)
            .presentationCompactAdaptation((.popover))
        }
    }
}

struct MultiPickerChildView<T: Identifiable & Hashable>: View {
    let options: [T]
    let valueFormatter: (T) -> String

    @Binding
    public var selection: [T]
    
    @State
    private var selectionNillable: [T?] = []

    var body: some View {
        List {
            ForEach(options.indices, id: \.self) { index in
                let option = options[index]
                
                Button {
                    toggleSelection(option, index: index)
                } label: {
                    HStack {
                        Text(valueFormatter(option))
                        
                        Spacer()
                        
                        if selection.contains(where: { $0.id == option.id }) {
                            Image(systemName: "checkmark").foregroundColor(.accentColor)
                        }
                    }
                }
                .foregroundStyle(.foreground)
                .tag(option.id)
            }
        }
        .onAppear {
            selectionNillable = selection
        }
        .onChange(of: selectionNillable) { _, newValue in
            selection = newValue.filter { $0 != nil } as! [T]
        }
    }

    private func toggleSelection(_ option: T, index: Int) {
        if selectionNillable[index] == nil {
            selectionNillable[index] = option
        } else {
            selectionNillable[index] = nil
        }
    }
}

#Preview {
    @Previewable @State
    var selection: [IdentifiableString] = ["A", "C"].map { IdentifiableString(string: $0) }

    Form {
        MultiPicker<Text, IdentifiableString>(
            label: Text("Multiselect"),
            options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
            valueFormatter: { $0.string },
            selection: $selection
        )
    }
}
