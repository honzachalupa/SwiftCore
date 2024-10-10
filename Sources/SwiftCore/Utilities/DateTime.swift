import Foundation

public struct DateTimeUtils {
    let dateFormatter = DateFormatter()
    
    public init() {}
    
    public func formatDate(_ date: Date, isShort: Bool = false) -> String {
        dateFormatter.dateFormat = isShort ? "d.M." : "d.M.yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public func formatDateLabel(_ date: Date) -> String {
        let calendar = Calendar.current
        
        if (calendar.isDateInYesterday(date)) {
            return String(localized: "Yesterday")
        }
        
        if (calendar.isDateInToday(date)) {
            return String(localized: "Today")
        }
        
        if (calendar.isDateInTomorrow(date)) {
            return String(localized: "Tomorrow")
        }
        
        return formatDate(date, isShort: true)
    }
    
    public func getDateNumber(_ date: Date) -> String {
        dateFormatter.dateFormat = "d"
        
        return dateFormatter.string(from: date)
    }
    
    public func getDateName(_ date: Date) -> String {
        dateFormatter.dateFormat = "EE"
        
        return dateFormatter.string(from: date)
    }
}
