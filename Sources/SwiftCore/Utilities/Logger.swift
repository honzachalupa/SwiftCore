import Foundation
import OSLog

let logger = Logger()

public func consoleLog(_ _message: String, _ data: Any? = nil) {
    var message = _message
    
    func isPrimitiveType(_ data: Any?) -> Bool {
        return type(of: data) != String.self ||
            type(of: data) != Int.self ||
            type(of: data) != Bool.self
    }
    
    if let data = data {
        let dataString =
            !isPrimitiveType(data) ?
                Mirror(reflecting: data).children.compactMap { "\($0.value)" }.joined(separator: "\n") :
                data
        
        message += "\nData: \(dataString)"
    }
    
    logger.log(
        level: .debug,
        "\(message)"
    )
}
