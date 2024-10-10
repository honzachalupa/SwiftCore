import SwiftUI

public struct PreviewGrid<Content: View>: View {
    var rows: Int
    var columns: Int
    @ViewBuilder var content: (_ x: Int, _ y: Int) -> Content
    
    public init(
        rows: Int = 3,
        columns: Int = 1,
        content: @escaping (_ x: Int, _ y: Int) -> Content
    ) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    public var body: some View {
        Grid {
            ForEach(0..<rows, id: \.self) { y in
                GridRow {
                    ForEach(0..<columns, id: \.self) { x in
                        content(x, y)
                    }
                }
            }
        }
    }
}

#Preview {
    Text("Default").font(.title)
    
    PreviewGrid() { x, y in
        Text("Cell [\(x);\(y)]")
            .padding()
    }
    
    Text("Custom").font(.title).padding(.top)
    
    PreviewGrid(rows: 5, columns: 3) { x, y in
        Text("Cell [\(x);\(y)]")
            .padding()
    }
}
