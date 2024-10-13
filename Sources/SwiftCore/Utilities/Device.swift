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

    @MainActor
    public func hapticTap(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
#if os(iOS)
        UIImpactFeedbackGenerator(style: style).impactOccurred()
#endif
    }
}
