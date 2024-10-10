import Foundation
@preconcurrency import PhoneNumberKit

public struct PhoneNumberUtils {
    let phoneNumberUtility = PhoneNumberUtility()
    
    public init() {}

    public func format(_ value: String) -> String {
        let DEFAULT_PREFIX = "CZ"
        
        do {
            let parsed = try phoneNumberUtility.parse(value, withRegion: DEFAULT_PREFIX)
            let formatted = phoneNumberUtility.format(parsed, toType: .international)
            
            return formatted
        } catch {
            print(error.localizedDescription, value)
            
            return value
        }
    }
}
