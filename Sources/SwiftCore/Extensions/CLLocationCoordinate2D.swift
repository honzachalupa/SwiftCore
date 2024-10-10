import CoreLocation

extension CLLocationCoordinate2D: Codable, @retroactive Hashable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        self.init()
        
        longitude = try container.decode(Double.self)
        latitude = try container.decode(Double.self)
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    var isEmpty: Bool {
        return self.latitude == 0 && self.longitude == 0
    }
}
