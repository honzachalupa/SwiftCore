import SwiftUI

public enum DeviceName: String {
    case iPhone
    case iPad
    case watch
    case mac
}

public struct DeviceUtils {
    public init() {}
    
    @MainActor
    public func getName() -> DeviceName {
    #if os(iOS)
        if (ProcessInfo.processInfo.isiOSAppOnMac) {
            return .mac
        } else
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            return .iPhone
        } else {
          return .iPad
        }
    #else
        return .watch
    #endif
    }

#if os(iOS)
    @MainActor
    public func hapticTap(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
#else
    public func hapticTap(_ style: Any? = nil) { }
#endif
}
