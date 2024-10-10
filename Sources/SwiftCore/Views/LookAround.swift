import SwiftUI
@preconcurrency import MapKit

#if os(iOS)
public struct LocationPreviewLookAroundView: View {
    var coordinates: CLLocationCoordinate2D
    @State private var lookAroundScene: MKLookAroundScene? = nil
    @State private var isFailed: Bool = false
    
    public init(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
    
    public var body: some View {
        VStack {
            if isFailed {
                LookAroundPreview(initialScene: lookAroundScene)
                    .cornerRadius(10)
            }
        }
        .task {
            await getLookAroundScene()
        }
        .onChange(of: coordinates.latitude) {
            Task {
                await getLookAroundScene()
            }
        }
    }
    
    private func getLookAroundScene() async {
        lookAroundScene = try? await MKLookAroundSceneRequest(coordinate: coordinates).scene
        
        isFailed = lookAroundScene != nil
    }
}

#Preview {
    let sampleCoordinates = CLLocationCoordinate2D(latitude: 50.0755, longitude: 14.4378)
    
    LocationPreviewLookAroundView(coordinates: sampleCoordinates)
        .padding()
}
#endif
