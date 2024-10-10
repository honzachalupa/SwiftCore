import SwiftUI

public enum DeviceName: String {
    case iPhone
    case iPad
    case watch
}

public struct DeviceUtils {
    public init() {}
    
    @MainActor
    public func getName() -> DeviceName {
    #if os(iOS)
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
#endif
}
