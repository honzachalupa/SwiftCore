import MapKit

public enum UrlType {
    case website, phoneNumber, emailAddress
}

@MainActor
public func openUrl(_ value: String, type: UrlType = .website) {
    var prefix: String
    
    switch type {
        case .emailAddress:
            prefix = "mailto://"
            break
        case .phoneNumber:
            prefix = "tel://"
            break
        default:
            prefix = ""
    }
    
#if os(iOS)
    UIApplication.shared.open(URL(string: "\(prefix)\(value)")!)
#endif
}

public func mapNavigate(name: String, coordinates: CLLocationCoordinate2D) {
    let destination = MKMapItem(
        placemark: MKPlacemark(coordinate: coordinates)
    )
    
    destination.name = name
    
    MKMapItem.openMaps(
        with: [destination],
        launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
    )
}
