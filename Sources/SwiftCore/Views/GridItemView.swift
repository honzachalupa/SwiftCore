import SwiftUI

public struct GridItemView: View {
    var title: String
    var value: String
    var systemIcon: String
    var iconBackground: Color
    
    public init(title: String, value: String, systemIcon: String, iconBackground: Color) {
        self.title = title
        self.value = value
        self.systemIcon = systemIcon
        self.iconBackground = iconBackground
    }
    
    public init(title: String, value: Int, systemIcon: String, iconBackground: Color) {
        self.title = title
        self.value = "\(value)"
        self.systemIcon = systemIcon
        self.iconBackground = iconBackground
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Colors.tileBackground)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(iconBackground)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: systemIcon)
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer(minLength: 5)
                    
                    Text(String(value))
                        .font(.largeTitle)
                }
                
                Spacer(minLength: 15)
                
                Text(title)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            .foregroundStyle(.foreground)
            .fontWeight(.bold)
            .padding(10)
        }
        .frame(height: 100)
    }
}
    
#Preview(traits: .sizeThatFitsLayout) {
    PreviewGrid { _, _ in
        Group {
            GridItemView(
                title: "Navštíveno",
                value: "69 %",
                systemIcon: "checkmark.circle.fill",
                iconBackground: .green
            )
            
            GridItemView(
                title: "Celkem",
                value: 666,
                systemIcon: "checkmark.circle",
                iconBackground: .red
            )
        }
    }
    .padding()
}
