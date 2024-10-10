public protocol Address {
    var street: String? { get set }
    var houseNumber: Int? { get set }
    var city: String? { get set }
    var country: String? { get set }
}

public struct AddressUtils {
    public init() {}
    
    public func formatAddress(_ address: Address) -> String {
        var formatted: [String] = []
        
        if let street = address.street, let houseNumber = address.houseNumber {
            formatted.append("\(street) \(houseNumber)".trimmingCharacters(in: .whitespacesAndNewlines))
        } else if let street = address.street {
            formatted.append(street)
        }
        
        if let city = address.city {
            formatted.append(city)
        }
        
        if let country = address.country {
            formatted.append(country)
        }
        
        return formatted
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }
}
