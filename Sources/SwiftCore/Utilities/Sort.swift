public struct SortUtils {
    public init() {}
    
    public func localizedSort(_ a: String, _ b: String) -> Bool {
        a.localizedStandardCompare(b) == .orderedAscending
    }
}
